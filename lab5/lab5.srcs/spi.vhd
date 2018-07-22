


library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use work.all;




entity accel_spi_rw is
  port (clk    : in  std_logic;
        reset  : in  std_logic;
        --Values from accelerometer used for movement and display
        DATA_X : out std_logic_vector(7 downto 0);
        DATA_Y : out std_logic_vector(7 downto 0);
        DATA_Z : out std_logic_vector(7 downto 0);
        ID_AD  : out std_logic_vector(7 downto 0);
        ID_1D  : out std_logic_vector(7 downto 0);
        --SPI Signals between FPGA and accelerometer
        CSb    : out std_logic;
        MOSI   : out std_logic;
        SCLK   : out std_logic;
        MISO   : in  std_logic);
end accel_spi_rw;

architecture Behavioral of accel_spi_rw is
  type state_type_command is (idlecmd, writeAddr2D, doneStartup, readAddr00, captureID_AD,
                              readAddr01, captureID_1D, readAddr08, captureX, readAddr09,
                              captureY, readAddr0A, captureZ);
  signal command_state, next_state : state_type_command;

  type state_type_SPI is (idlespi, setCSlow, sclkHi, sclkLo, incSclkCntr,
                          checkSclkCntr, setCShi, Wait100ms, done);
  signal SPI_state, SPI_next_state : state_type_SPI;

  signal SPIdone    : std_logic;
  signal SPIstart   : std_logic;
  signal toSPIbytes : std_logic_vector (23 downto 0);

  signal timerstart : std_logic;
  signal timerMax   : integer range 0 to 100000;
  signal timerDone  : std_logic;
  signal timerCntr  : integer range 0 to 100000;

  signal sclkint  : std_logic;
  signal CSbint   : std_logic;
  signal sclkCntr : integer range 0 to 24;

  signal regX  : std_logic_vector (23 downto 0);
  signal regY  : std_logic_vector (23 downto 0);
  signal regZ  : std_logic_vector (23 downto 0);
  signal reg1D : std_logic_vector (23 downto 0);
  signal regAD : std_logic_vector (23 downto 0);

  signal SPI_shiftregister : std_logic_vector (23 downto 0);

  signal sclk_d       : std_logic;
  signal sclk_falling : std_logic;
  signal sclk_rising  : std_logic;

  signal MOSIint : std_logic;
  signal incSclk : std_logic;

begin
  commandFSMtransitions : process (SPIdone, command_state)
  begin
    next_state <= command_state;
    case command_state is
      when idlecmd => next_state <= writeAddr2D;
      when writeAddr2D =>
        if (SPIdone = '1') then
          next_state <= doneStartup;
        else
          next_state <= writeAddr2D;    --hold
        end if;
      when doneStartup =>
        next_state <= readAddr00;
      when readAddr00 =>
        if (SPIdone = '1') then
          next_state <= captureID_AD;
        else
          next_state <= readAddr00;     -- hold
        end if;
      when captureID_AD =>
        next_state <= readAddr01;
      when readAddr01 =>
        if (SPIdone = '1') then
          next_state <= captureID_1D;
        else
          next_state <= readAddr01;
        end if;
      when captureID_1D =>
        next_state <= readAddr08;
      when readAddr08 =>
        if (SPIdone = '1') then
          next_state <= captureX;
        else
          next_state <= readAddr08;
        end if;
      when captureX =>
        next_state <= readAddr09;
      when readAddr09 =>
        if (SPIdone = '1') then
          next_state <= captureY;
        else
          next_state <= readAddr09;
        end if;
      when captureY =>
        next_state <= readAddr0A;
      when readAddr0A =>
        if (SPIdone = '1') then
          next_state <= captureZ;
        else
          next_state <= readAddr0A;
        end if;
      when captureZ =>
        next_state <= readAddr00;
    end case;
  end process;

  commandFSMregister : process(clk, reset)
  begin
    if (reset = '1') then
      command_state <= idlecmd;
    elsif (rising_Edge(clk)) then
      command_state <= next_state;
    end if;
  end process;

  commandFSMoutputs : process(command_state)
  begin
    case command_state is

      when idlecmd =>
        SPIstart   <= '1';
        toSPIbytes <= x"0A2D02";
      when writeAddr2D =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
      when doneStartup =>
        SPIstart   <= '1';
        toSPIbytes <= x"0B0000";
      when readAddr00 =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
      when captureID_AD =>
        SPIstart   <= '1';
        toSPIbytes <= x"0B0100";
      when readAddr01 =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
      when captureID_1D =>
        SPIstart   <= '1';
        toSPIbytes <= x"0B0800";
      when readAddr08 =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
      when captureX =>
        SPIstart   <= '1';
        toSPIbytes <= x"0B0900";
      when readAddr09 =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
      when captureY =>
        SPIstart   <= '1';
        toSPIbytes <= x"0B0A00";
      when readAddr0A =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
      when captureZ =>
        SPIstart   <= '1';
        toSPIbytes <= x"0B0000";

      when others =>
        SPIstart   <= '0';
        toSPIbytes <= (others => '0');
    end case;
  end process;

  SPI_FSMtransitions : process(SPIstart, SPI_state, timerDone, sclkCntr)
  begin
    SPI_next_state <= SPI_state;
    case SPI_state is

      when idlespi =>
        if SPIstart = '1' then
          SPI_next_state <= setCSlow;
        else
          SPI_next_state <= idlespi;
        end if;
      when setCSlow =>
        if timerDone = '1' then
          SPI_next_state <= sclkHi;
        else
          SPI_next_state <= setCSlow;
        end if;
      when sclkHi =>
        if timerDone = '1' then
          SPI_next_state <= sclkLo;
        else
          SPI_next_state <= sclkHi;
        end if;
      when sclkLo =>
        if timerDone = '1' then
          SPI_next_state <= incSclkCntr;
        else
          SPI_next_state <= sclkLo;
        end if;
      when incSclkCntr =>
        SPI_next_state <= checkSclkCntr;
      when checkSclkCntr =>
        if sclkCntr = 24 then
          SPI_next_state <= setCShi;
        else
          SPI_next_state <= sclkHi;
        end if;
      when setCShi =>
        SPI_next_state <= Wait100ms;
      when Wait100ms =>
        if timerDone = '1' then
          SPI_next_state <= done;
        else
          SPI_next_state <= Wait100ms;
        end if;
      when done =>
        SPI_next_state <= idlespi;
    end case;
  end process;

  SPI_FSMregister : process(clk, reset)
  begin
    if (reset = '1') then
      SPI_state <= idlespi;
    elsif (rising_edge(clk)) then
      SPI_state <= SPI_next_state;
    end if;
  end process;

  SPI_FSMoutputs : process(SPI_state)
  begin
    case SPI_state is
      when idlespi =>
        CSbint     <= '1';
        timerstart <= '0';
        timerMax   <= 0;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';

      when setCSlow =>
        CSbint     <= '0';
        timerstart <= '1';
        timerMax   <= 19;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';

      when sclkHi =>
        CSbint     <= '0';
        timerstart <= '1';
        timerMax   <= 49;
        sclkint    <= '1';
        incSclk    <= '0';
        SPIdone    <= '0';

      when sclkLo =>
        CSbint     <= '0';
        timerstart <= '1';
        timerMax   <= 47;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';

      when incSclkCntr =>
        CSbint     <= '0';
        timerstart <= '0';
        timerMax   <= 0;
        sclkint    <= '0';
        incSclk    <= '1';
        SPIdone    <= '0';

      when checkSclkCntr =>
        CSbint     <= '0';
        timerstart <= '0';
        timerMax   <= 0;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';

      when setCShi =>
        CSbint     <= '1';
        timerstart <= '0';
        timerMax   <= 0;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';

      when Wait100ms =>
        CSbint     <= '1';
        timerstart <= '1';
        timerMax   <= 100000;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';

      when done =>
        CSbint     <= '1';
        timerstart <= '0';
        timerMax   <= 0;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '1';


      when others =>
        CSbint     <= '1';
        timerstart <= '0';
        timerMax   <= 0;
        sclkint    <= '0';
        incSclk    <= '0';
        SPIdone    <= '0';


    end case;
  end process;

  sclkCounter : process(clk, reset)
  begin
    if reset = '1' then
      sclkCntr <= 0;
    elsif rising_edge(clk) then
      if CSbint = '1' then  -- this resets the counter/keeps counter zero when not driving SCLK
        sclkCntr <= 0;
      elsif incSclk = '1' then
        sclkCntr <= sclkCntr + 1;

      end if;

    end if;
  end process;
  --rising and falling edge functions for SCLK to avoid using clock buffer
  sclk_d       <= sclkint when rising_edge(clk);  --infers a flip flop
  sclk_rising  <= not sclk_d and sclkint;
  sclk_falling <= sclk_d and not sclkint;

  MISO_register : process(clk, reset)
  begin
    if reset = '1' then                 --take all inputs to zero
      regX  <= (others => '0');
      regY  <= (others => '0');
      regZ  <= (others => '0');
      reg1D <= (others => '0');
      regAD <= (others => '0');
    elsif rising_edge(clk) then
      if sclkint = '0' then
        if SPI_state = checkSclkCntr then
          if sclkCntr < 24 then
            if command_state = readAddr00 then
              regAD(0)            <= MISO;
              regAD (23 downto 1) <= regAD(22 downto 0);
            elsif command_state = readAddr01 then
              reg1D(0)            <= MISO;
              reg1D (23 downto 1) <= reg1D(22 downto 0);
            elsif command_state = readAddr08 then
              regX(0)            <= MISO;
              regX (23 downto 1) <= regX(22 downto 0);
            elsif command_state = readAddr09 then
              regY(0)            <= MISO;
              regY (23 downto 1) <= regY(22 downto 0);
            elsif command_state = readAddr0A then
              regZ(0)            <= MISO;
              regZ (23 downto 1) <= regZ(22 downto 0);
            end if;
          end if;
        end if;
      end if;
    end if;
  end process;
  -- type conversions and assigments for output registers
  DATA_X <= regX(7 downto 0);
  DATA_Y <= regY(7 downto 0);
  DATA_Z <= regZ(7 downto 0);
  ID_AD  <= regAD(7 downto 0);
  ID_1D  <= reg1D(7 downto 0);

  MOSI_register : process(clk)  --reset accomplished in commandFSMregister (idlecmd)
  begin
    if rising_edge(clk) then
      if (SPIstart = '1') then          --read in toSPIbytes
        SPI_shiftregister <= toSPIbytes;
      elsif SPI_state = setCSlow then
        if timerDone = '1' then
          MOSIint                         <= SPI_shiftregister(23);
          SPI_shiftregister (23 downto 1) <= SPI_shiftregister (22 downto 0);
        end if;
      elsif SPI_state = checkSclkCntr then
        MOSIint                         <= SPI_shiftregister(23);
        SPI_shiftregister (23 downto 1) <= SPI_shiftregister (22 downto 0);
      end if;
    end if;
  end process;

  timer : process(clk, reset)
  begin
    if reset = '1' then
      timerCntr <= 0;
    elsif rising_edge(clk) then
      if timerstart = '1' then
        if timerCntr < timerMax then
          timerCntr <= timerCntr + 1;
        else
          timerCntr <= 0;
        end if;
      else
        timerCntr <= 0;
      end if;
    end if;
  end process;
  timerDone <= '1' when timerCntr = timerMax else '0';
  MOSI      <= MOSIint;
  SCLK      <= sclkint;
  CSb       <= CSbint;
end architecture;
