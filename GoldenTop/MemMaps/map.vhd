library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mainmap is
  port (
    aclk                 : in    std_logic;
    areset_n             : in    std_logic;
    awvalid              : in    std_logic;
    awready              : out   std_logic;
    awaddr               : in    std_logic_vector(2 downto 2);
    awprot               : in    std_logic_vector(2 downto 0);
    wvalid               : in    std_logic;
    wready               : out   std_logic;
    wdata                : in    std_logic_vector(31 downto 0);
    wstrb                : in    std_logic_vector(3 downto 0);
    bvalid               : out   std_logic;
    bready               : in    std_logic;
    bresp                : out   std_logic_vector(1 downto 0);
    arvalid              : in    std_logic;
    arready              : out   std_logic;
    araddr               : in    std_logic_vector(2 downto 2);
    arprot               : in    std_logic_vector(2 downto 0);
    rvalid               : out   std_logic;
    rready               : in    std_logic;
    rdata                : out   std_logic_vector(31 downto 0);
    rresp                : out   std_logic_vector(1 downto 0);
    fpgaOutputs_leds_o   : out   std_logic_vector(3 downto 0);
    fpgaInputs_DIPSW_i   : in    std_logic_vector(3 downto 0);
    fpgaInputs_Buttons_i : in    std_logic_vector(1 downto 0)
  );
end mainmap;

architecture syn of mainmap is
  signal rd_int                         : std_logic;
  signal wr_int                         : std_logic;
  signal rd_ack_int                     : std_logic;
  signal wr_ack_int                     : std_logic;
  signal dato                           : std_logic_vector(31 downto 0);
  signal axi_wip                        : std_logic;
  signal axi_wdone                      : std_logic;
  signal axi_rip                        : std_logic;
  signal axi_rdone                      : std_logic;
  signal fpgaOutputs_leds_reg           : std_logic_vector(3 downto 0);
  signal reg_rdat_int                   : std_logic_vector(31 downto 0);
  signal rd_ack1_int                    : std_logic;
begin

  -- AW, W and B channels
  wr_int <= (awvalid and wvalid) and not axi_wip;
  awready <= axi_wip and wr_ack_int;
  wready <= axi_wip and wr_ack_int;
  bvalid <= axi_wdone;
  process (aclk, areset_n) begin
    if areset_n = '0' then 
      axi_wip <= '0';
      axi_wdone <= '0';
    elsif rising_edge(aclk) then
      axi_wip <= (awvalid and wvalid) and not axi_wdone;
      axi_wdone <= wr_ack_int or (axi_wdone and not bready);
    end if;
  end process;
  bresp <= "00";

  -- AR and R channels
  rd_int <= arvalid and not axi_rip;
  arready <= axi_rip and rd_ack_int;
  rvalid <= axi_rdone;
  process (aclk, areset_n) begin
    if areset_n = '0' then 
      axi_rip <= '0';
      axi_rdone <= '0';
      rdata <= (others => '0');
    elsif rising_edge(aclk) then
      axi_rip <= arvalid and not axi_rdone;
      if rd_ack_int = '1' then
        rdata <= dato;
      end if;
      axi_rdone <= rd_ack_int or (axi_rdone and not rready);
    end if;
  end process;
  rresp <= "00";

  -- Assign outputs
  fpgaOutputs_leds_o <= fpgaOutputs_leds_reg;

  -- Process for write requests.
  process (aclk, areset_n) begin
    if areset_n = '0' then 
      wr_ack_int <= '0';
      fpgaOutputs_leds_reg <= "0000";
    elsif rising_edge(aclk) then
      wr_ack_int <= '0';
      case awaddr(2 downto 2) is
      when "0" => 
        -- Register fpgaOutputs
        if wr_int = '1' then
          fpgaOutputs_leds_reg <= wdata(3 downto 0);
        end if;
        wr_ack_int <= wr_int;
      when "1" => 
        -- Register fpgaInputs
      when others =>
        wr_ack_int <= wr_int;
      end case;
    end if;
  end process;

  -- Process for registers read.
  process (aclk, areset_n) begin
    if areset_n = '0' then 
      rd_ack1_int <= '0';
      reg_rdat_int <= (others => 'X');
    elsif rising_edge(aclk) then
      reg_rdat_int <= (others => '0');
      case araddr(2 downto 2) is
      when "0" => 
        -- fpgaOutputs
        reg_rdat_int(3 downto 0) <= fpgaOutputs_leds_reg;
        rd_ack1_int <= rd_int;
      when "1" => 
        -- fpgaInputs
        reg_rdat_int(5 downto 2) <= fpgaInputs_DIPSW_i;
        reg_rdat_int(1 downto 0) <= fpgaInputs_Buttons_i;
        rd_ack1_int <= rd_int;
      when others =>
        rd_ack1_int <= rd_int;
      end case;
    end if;
  end process;

  -- Process for read requests.
  process (araddr, reg_rdat_int, rd_ack1_int, rd_int) begin
    -- By default ack read requests
    dato <= (others => '0');
    case araddr(2 downto 2) is
    when "0" => 
      -- fpgaOutputs
      dato <= reg_rdat_int;
      rd_ack_int <= rd_ack1_int;
    when "1" => 
      -- fpgaInputs
      dato <= reg_rdat_int;
      rd_ack_int <= rd_ack1_int;
    when others =>
      rd_ack_int <= rd_int;
    end case;
  end process;
end syn;
