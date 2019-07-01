-----------------------------------------------------------------------------
-- Author : Nathan 
-- Description : Attempt at an easy to read top level for the Cyclone V Dev
--               kit
--
-- Functions : TODO: entity port map
--             TODO: Simple leds blinker program
--             TODO: Add HPS - find easy way to regenerate/create sources
--             TODO: Add VHDL RAM master
--
-----------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.golden_top_pkg.all;
use work.axi4_pkg.all;

entity golden_top is
  port
  (
    -- FPGA specific ports
    fpga_clk_50 : in std_logic;
    fpga_button_pio : in std_logic_vector(1 downto 0);
    fpga_dipsw_pio : in std_logic_vector(3 downto 0);
    fpga_led_pio : out std_logic_vector(3 downto 0);
    
    -- HPS specific ports
    -- NOTE: since altera's qsf port naming doesn't use suffix conventions
    -- for pins names -> hence will need to debug that later on
    -- NOTE: Quartus won't instantiate anything if wrong logic instantiated
    hps_memory_oct_rzqin : in std_logic;
    hps_memory_mem_a : out std_logic_vector(14 downto 0);
    hps_memory_mem_cke : out std_logic;
    hps_memory_mem_cs_n : out std_logic;
    hps_memory_mem_ba : out std_logic_vector(2 downto 0);
    hps_memory_mem_ras_n : out std_logic;
    hps_memory_mem_cas_n : out std_logic;
    hps_memory_mem_we_n : out std_logic;
    hps_memory_mem_reset_n : out std_logic;
    hps_memory_mem_odt : out std_logic;
    hps_memory_mem_dm : out std_logic_vector(4 downto 0);
    hps_memory_mem_dq : inout std_logic_vector(39 downto 0);
    hps_memory_mem_dqs : inout std_logic_vector(4 downto 0);
    hps_memory_mem_dqs_n : inout std_logic_vector(4 downto 0);
    hps_memory_mem_ck : out std_logic;
    hps_memory_mem_ck_n : out std_logic;

    -- Just copied thoses from the main GoldenReferenceTop
    -- TODO: figure out what to do with thoses
    hps_dipsw_pio : in std_logic_vector(3 downto 0);
    hps_leds_pio : out std_logic_vector(3 downto 0);
    hps_buttons_pio : in std_logic_vector(3 downto 0);

    hps_emac1_TX_CLK : out std_logic;   
    hps_emac1_TXD0 : out std_logic;     
    hps_emac1_TXD1 : out std_logic;     
    hps_emac1_TXD2 : out std_logic;
    hps_emac1_TXD3 : out std_logic;
    hps_emac1_RXD0 : in std_logic;     
    hps_emac1_MDIO : inout std_logic;
    hps_emac1_MDC : out std_logic;
    hps_emac1_RX_CTL : in std_logic;
    hps_emac1_TX_CTL : out std_logic;
    hps_emac1_RX_CLK : in std_logic;
    hps_emac1_RXD1 : in std_logic;
    hps_emac1_RXD2 : in std_logic;
    hps_emac1_RXD3 : in std_logic;
    hps_qspi_IO0 : inout std_logic;       
    hps_qspi_IO1 : inout std_logic;       
    hps_qspi_IO2 : inout std_logic;       
    hps_qspi_IO3 : inout std_logic;       
    hps_qspi_SS0 : out std_logic;
    hps_qspi_CLK : out std_logic;       
    hps_sdio_CMD : inout std_logic;       
    hps_sdio_D0 : inout std_logic;        
    hps_sdio_D1 : inout std_logic;        
    hps_sdio_CLK : out std_logic;       
    hps_sdio_D2 : inout std_logic;        
    hps_sdio_D3 : inout std_logic;        
    hps_usb1_D0 : inout std_logic;        
    hps_usb1_D1 : inout std_logic;        
    hps_usb1_D2 : inout std_logic;        
    hps_usb1_D3 : inout std_logic;        
    hps_usb1_D4 : inout std_logic;        
    hps_usb1_D5 : inout std_logic;        
    hps_usb1_D6 : inout std_logic;        
    hps_usb1_D7 : inout std_logic;        
    hps_usb1_CLK : in std_logic;
    hps_usb1_STP : out std_logic;       
    hps_usb1_DIR : in std_logic;       
    hps_usb1_NXT : in std_logic;       
    hps_spim0_CLK : out std_logic;      
    hps_spim0_MOSI : out std_logic;     
    hps_spim0_MISO : in std_logic;     
    hps_spim0_SS0 : out std_logic;      
    hps_uart0_RX : in std_logic;       
    hps_uart0_TX : out std_logic;       
    hps_i2c0_SDA : inout std_logic;       
    hps_i2c0_SCL : inout std_logic;       
    hps_can0_RX : in std_logic;        
    hps_can0_TX : out std_logic;        
    hps_trace_CLK : out std_logic;      
    hps_trace_D0 : out std_logic;       
    hps_trace_D1 : out std_logic;       
    hps_trace_D2 : out std_logic;       
    hps_trace_D3 : out std_logic;       
    hps_trace_D4 : out std_logic;       
    hps_trace_D5 : out std_logic;       
    hps_trace_D6 : out std_logic;       
    hps_trace_D7 : out std_logic;       
    --hps_gpio_GPIO09 : inout std_logic;    
    --hps_gpio_GPIO35 : inout std_logic;    
    --hps_gpio_GPIO41 : inout std_logic;    
    --hps_gpio_GPIO42 : inout std_logic;    
    --hps_gpio_GPIO43 : inout std_logic;    
    --hps_gpio_GPIO44 : inout std_logic;

    -- HSMC 
    hsma_d : out std_logic_vector(79 downto 0);
    --hsma_tx_p0 : inout std_logic;
    --hsma_tx_n0 : inout std_logic;
    --hsma_rx_p0 : inout std_logic;
    --hsma_rx_n0 : inout std_logic;
    --hsma_tx_p1 : inout std_logic;
    --hsma_tx_n1 : inout std_logic;
    --hsma_rx_p1 : inout std_logic;
    --hsma_rx_n1 : inout std_logic;
    --hsma_tx_p2 : inout std_logic;
    --hsma_tx_n2 : inout std_logic;
    --hsma_rx_p2 : inout std_logic;
    --hsma_rx_n2 : inout std_logic;
    --hsma_tx_p3 : inout std_logic;
    --hsma_tx_n3 : inout std_logic;
    --hsma_rx_p3 : inout std_logic;
    --hsma_rx_n3 : inout std_logic;

    --hsma_sda : inout std_logic;
    --hsma_scl : inout std_logic;
    --hsma_clk_out0 : out std_logic;
    --hsma_clk_in0 : in std_logic;
    hsma_prst_n : in std_logic


  );
end golden_top;

architecture rtl of golden_top is
  signal s_axi4full_mo : t_axi4_full_master_out_32;
  signal s_axi4full_mi : t_axi4_full_master_in_32;
  signal s_axi4lite_mo : t_axi4_lite_master_out_32;
  signal s_axi4lite_mi : t_axi4_lite_master_in_32;

  signal s_fpga_leds : std_logic_vector(3 downto 0);
  signal s_fpga_dipsw : std_logic_vector(3 downto 0);
  signal s_fpga_buttons : std_logic_vector(1 downto 0);

  signal s_dummyawlen, s_dummyarlen : std_logic_vector(3 downto 0);
  signal s_8bits_awlen, s_8bits_arlen : std_logic_vector(7 downto 0);

begin

  s_axi4lite_mo <= f_axi4_full_to_lite(s_axi4full_mo);
  s_axi4full_mi <= f_axi4_lite_to_full(s_axi4lite_mi);

  s_fpga_buttons <= fpga_button_pio;
  s_fpga_dipsw <= fpga_dipsw_pio;

  p_blinks_leds : process(fpga_clk_50)
    variable decode : integer;
  begin
    if rising_edge(fpga_clk_50) then
      fpga_led_pio <= s_fpga_leds;
      hsma_d <= (others => '0');
      
      decode := to_integer(unsigned(fpga_dipsw_pio&fpga_button_pio));

      if decode <= 79 then
        hsma_d(decode) <= '1';
      end if;
    end if;
  end process p_blinks_leds;

  cmp_hps : standalone_hps
  port map
  (
    clk_clk                         => fpga_clk_50,
    reset_reset_n                   => '1',

		buttons_i_export                => hps_buttons_pio,
    dipsw_i_export                  => hps_dipsw_pio,
    leds_o_export                   => hps_leds_pio,

    hps_io_hps_io_emac1_inst_TX_CLK => hps_emac1_TX_CLK,
    hps_io_hps_io_emac1_inst_TXD0   => hps_emac1_TXD0,
    hps_io_hps_io_emac1_inst_TXD1   => hps_emac1_TXD1,
    hps_io_hps_io_emac1_inst_TXD2   => hps_emac1_TXD2,
    hps_io_hps_io_emac1_inst_TXD3   => hps_emac1_TXD3,
    hps_io_hps_io_emac1_inst_RXD0   => hps_emac1_RXD0,
    hps_io_hps_io_emac1_inst_MDIO   => hps_emac1_MDIO,
    hps_io_hps_io_emac1_inst_MDC    => hps_emac1_MDC,
    hps_io_hps_io_emac1_inst_RX_CTL => hps_emac1_RX_CTL,
    hps_io_hps_io_emac1_inst_TX_CTL => hps_emac1_TX_CTL,
    hps_io_hps_io_emac1_inst_RX_CLK => hps_emac1_RX_CLK,
    hps_io_hps_io_emac1_inst_RXD1   => hps_emac1_RXD1,
    hps_io_hps_io_emac1_inst_RXD2   => hps_emac1_RXD2,
    hps_io_hps_io_emac1_inst_RXD3   => hps_emac1_RXD3,

    hps_io_hps_io_qspi_inst_IO0     => hps_qspi_IO0,
    hps_io_hps_io_qspi_inst_IO1     => hps_qspi_IO1,
    hps_io_hps_io_qspi_inst_IO2     => hps_qspi_IO2,
    hps_io_hps_io_qspi_inst_IO3     => hps_qspi_IO3,
    hps_io_hps_io_qspi_inst_SS0     => hps_qspi_SS0,
    hps_io_hps_io_qspi_inst_CLK     => hps_qspi_CLK,

    hps_io_hps_io_sdio_inst_CMD     => hps_sdio_CMD,
    hps_io_hps_io_sdio_inst_D0      => hps_sdio_D0,
    hps_io_hps_io_sdio_inst_D1      => hps_sdio_D1,
    hps_io_hps_io_sdio_inst_D2      => hps_sdio_D2,
    hps_io_hps_io_sdio_inst_D3      => hps_sdio_D3,
    hps_io_hps_io_sdio_inst_CLK     => hps_sdio_CLK,

    hps_io_hps_io_usb1_inst_D0      => hps_usb1_D0,
    hps_io_hps_io_usb1_inst_D1      => hps_usb1_D1,
    hps_io_hps_io_usb1_inst_D2      => hps_usb1_D2,
    hps_io_hps_io_usb1_inst_D3      => hps_usb1_D3,
    hps_io_hps_io_usb1_inst_D4      => hps_usb1_D4,
    hps_io_hps_io_usb1_inst_D5      => hps_usb1_D5,
    hps_io_hps_io_usb1_inst_D6      => hps_usb1_D6,
    hps_io_hps_io_usb1_inst_D7      => hps_usb1_D7,
    hps_io_hps_io_usb1_inst_CLK     => hps_usb1_CLK,
    hps_io_hps_io_usb1_inst_STP     => hps_usb1_STP,
    hps_io_hps_io_usb1_inst_DIR     => hps_usb1_DIR,
    hps_io_hps_io_usb1_inst_NXT     => hps_usb1_NXT,

    hps_io_hps_io_spim0_inst_CLK    => hps_spim0_CLK,
    hps_io_hps_io_spim0_inst_MOSI   => hps_spim0_MOSI,
    hps_io_hps_io_spim0_inst_MISO   => hps_spim0_MISO,
    hps_io_hps_io_spim0_inst_SS0    => hps_spim0_SS0,

    hps_io_hps_io_uart0_inst_RX     => hps_uart0_RX,
    hps_io_hps_io_uart0_inst_TX     => hps_uart0_TX,

    hps_io_hps_io_i2c0_inst_SDA     => hps_i2c0_SDA,
    hps_io_hps_io_i2c0_inst_SCL     => hps_i2c0_SCL,

    hps_io_hps_io_can0_inst_RX      => hps_can0_RX,
    hps_io_hps_io_can0_inst_TX      => hps_can0_TX,

    hps_io_hps_io_trace_inst_D0     => hps_trace_D0,
    hps_io_hps_io_trace_inst_D1     => hps_trace_D1,
    hps_io_hps_io_trace_inst_D2     => hps_trace_D2,
    hps_io_hps_io_trace_inst_D3     => hps_trace_D3,
    hps_io_hps_io_trace_inst_D4     => hps_trace_D4,
    hps_io_hps_io_trace_inst_D5     => hps_trace_D5,
    hps_io_hps_io_trace_inst_D6     => hps_trace_D6,
    hps_io_hps_io_trace_inst_D7     => hps_trace_D7,
    hps_io_hps_io_trace_inst_CLK    => hps_trace_CLK,

    memory_mem_a                    => hps_memory_mem_a,
    memory_mem_ba                   => hps_memory_mem_ba,
    memory_mem_ck                   => hps_memory_mem_ck,
    memory_mem_ck_n                 => hps_memory_mem_ck_n,
    memory_mem_cke                  => hps_memory_mem_cke,
    memory_mem_cs_n                 => hps_memory_mem_cs_n,
    memory_mem_ras_n                => hps_memory_mem_ras_n,
    memory_mem_cas_n                => hps_memory_mem_cas_n,
    memory_mem_we_n                 => hps_memory_mem_we_n,
    memory_mem_reset_n              => hps_memory_mem_reset_n,
    memory_mem_dq                   => hps_memory_mem_dq,
    memory_mem_dqs                  => hps_memory_mem_dqs,
    memory_mem_dqs_n                => hps_memory_mem_dqs_n,
    memory_mem_odt                  => hps_memory_mem_odt,
    memory_mem_dm                   => hps_memory_mem_dm,
    memory_oct_rzqin                => hps_memory_oct_rzqin,

		h2f_bus_awid => s_axi4full_mo.AWID,
		h2f_bus_awaddr => s_axi4full_mo.AWADDR(29 downto 0),
		h2f_bus_awlen => s_8bits_awlen,
		h2f_bus_awsize => s_axi4full_mo.AWSIZE,
		h2f_bus_awburst => s_axi4full_mo.AWBURST,
		h2f_bus_awlock => s_axi4full_mo.AWLOCK(0 downto 0),
		h2f_bus_awcache => s_axi4full_mo.AWCACHE,
		h2f_bus_awprot => s_axi4full_mo.AWPROT,
		h2f_bus_awqos => s_axi4full_mo.AWQOS,
		h2f_bus_awvalid => s_axi4full_mo.AWVALID,
		h2f_bus_awready => s_axi4full_mi.AWREADY,
		h2f_bus_wdata => s_axi4full_mo.WDATA,
		h2f_bus_wstrb => s_axi4full_mo.WSTRB,
		h2f_bus_wlast => s_axi4full_mo.WLAST,
		h2f_bus_wvalid => s_axi4full_mo.WVALID,
		h2f_bus_wready => s_axi4full_mi.WREADY,
		h2f_bus_bid => s_axi4full_mi.BID,
		h2f_bus_bresp => s_axi4full_mi.BRESP,
		h2f_bus_bvalid => s_axi4full_mi.BVALID,
		h2f_bus_bready => s_axi4full_mo.BREADY,
		h2f_bus_arid => s_axi4full_mo.ARID,
		h2f_bus_araddr => s_axi4full_mo.ARADDR(29 downto 0),
		h2f_bus_arlen => s_8bits_arlen,
		h2f_bus_arsize => s_axi4full_mo.ARSIZE,
		h2f_bus_arburst => s_axi4full_mo.ARBURST,
		h2f_bus_arlock => s_axi4full_mo.ARLOCK(0 downto 0),
		h2f_bus_arcache => s_axi4full_mo.ARCACHE,
		h2f_bus_arprot => s_axi4full_mo.ARPROT,
		h2f_bus_arqos => s_axi4full_mo.ARQOS,
		h2f_bus_arvalid => s_axi4full_mo.ARVALID,
		h2f_bus_arready => s_axi4full_mi.ARREADY,
		h2f_bus_rid => s_axi4full_mi.RID,
		h2f_bus_rdata => s_axi4full_mi.RDATA,
		h2f_bus_rresp => s_axi4full_mi.RRESP,
		h2f_bus_rlast => s_axi4full_mi.RLAST,
		h2f_bus_rvalid => s_axi4full_mi.RVALID,
		h2f_bus_rready => s_axi4full_mo.RREADY
  );
  s_8bits_arlen <= s_dummyarlen&s_axi4full_mo.ARLEN;
  s_8bits_awlen <= s_dummyawlen&s_axi4full_mo.AWLEN;

  cmp_main_memory_map : mainmap
  port map
  (
    aclk => fpga_clk_50,
    areset_n => '1',
    
    awvalid               =>  s_axi4lite_mo.AWVALID,
    awready               =>  s_axi4lite_mi.AWREADY,
    awaddr                =>  s_axi4lite_mo.AWADDR(2 downto 2),
    awprot                => (others => '0'), 
    wvalid                =>  s_axi4lite_mo.WVALID,
    wready                =>  s_axi4lite_mi.WREADY,
    wdata                 =>  s_axi4lite_mo.WDATA,
    wstrb                 =>  s_axi4lite_mo.WSTRB,
    bvalid                =>  s_axi4lite_mi.BVALID,
    bready                =>  s_axi4lite_mo.BREADY,
    bresp                 =>  s_axi4lite_mi.BRESP,
    arvalid               =>  s_axi4lite_mo.ARVALID,
    arready               =>  s_axi4lite_mi.ARREADY,
    araddr                =>  s_axi4lite_mo.ARADDR(2 downto 2),
    arprot                =>  (others => '0'),
    rvalid                =>  s_axi4lite_mi.RVALID,
    rready                =>  s_axi4lite_mo.RREADY,
    rdata                 =>  s_axi4lite_mi.RDATA,
    rresp                 =>  s_axi4lite_mi.RRESP,
    fpgaOutputs_leds_o    =>  s_fpga_leds,
    fpgaInputs_DIPSW_i    =>  s_fpga_dipsw,
    fpgaInputs_Buttons_i  =>  s_fpga_buttons

  );

end rtl;
