-----------------------------------------------------------------------------
-- Author : Nathan 
-- Description : Package, mostly for components declarations 
--
-----------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

package golden_top_pkg is
  component standalone_hps is
	port (
		buttons_i_export                : in    std_logic_vector(3 downto 0)  := (others => '0'); 
		clk_clk                         : in    std_logic                     := '0';             
		dipsw_i_export                  : in    std_logic_vector(3 downto 0)  := (others => '0'); 
		h2f_reset_reset_n               : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := '0';             
		hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := '0';             
		hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := '0';             
		hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        
		hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := '0';             
		hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := '0';             
		hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := '0';             
		hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := '0';             
		hps_io_hps_io_qspi_inst_IO0     : inout std_logic                     := '0';             
		hps_io_hps_io_qspi_inst_IO1     : inout std_logic                     := '0';             
		hps_io_hps_io_qspi_inst_IO2     : inout std_logic                     := '0';             
		hps_io_hps_io_qspi_inst_IO3     : inout std_logic                     := '0';             
		hps_io_hps_io_qspi_inst_SS0     : out   std_logic;                                        
		hps_io_hps_io_qspi_inst_CLK     : out   std_logic;                                        
		hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := '0';             
		hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := '0';             
		hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := '0';             
		hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        
		hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := '0';             
		hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D0      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D1      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D2      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D3      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D4      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D5      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D6      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_D7      : inout std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_CLK     : in    std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_STP     : out   std_logic;                                        
		hps_io_hps_io_usb1_inst_DIR     : in    std_logic                     := '0';             
		hps_io_hps_io_usb1_inst_NXT     : in    std_logic                     := '0';             
		hps_io_hps_io_spim0_inst_CLK    : out   std_logic;                                        
		hps_io_hps_io_spim0_inst_MOSI   : out   std_logic;                                        
		hps_io_hps_io_spim0_inst_MISO   : in    std_logic                     := '0';             
		hps_io_hps_io_spim0_inst_SS0    : out   std_logic;                                        
		hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := '0';             
		hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        
		hps_io_hps_io_i2c0_inst_SDA     : inout std_logic                     := '0';             
		hps_io_hps_io_i2c0_inst_SCL     : inout std_logic                     := '0';             
		hps_io_hps_io_can0_inst_RX      : in    std_logic                     := '0';             
		hps_io_hps_io_can0_inst_TX      : out   std_logic;                                        
		hps_io_hps_io_trace_inst_CLK    : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D0     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D1     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D2     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D3     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D4     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D5     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D6     : out   std_logic;                                        
		hps_io_hps_io_trace_inst_D7     : out   std_logic;                                        
		leds_o_export                   : out   std_logic_vector(3 downto 0);                     
		memory_mem_a                    : out   std_logic_vector(14 downto 0);                    
		memory_mem_ba                   : out   std_logic_vector(2 downto 0);                     
		memory_mem_ck                   : out   std_logic;                                        
		memory_mem_ck_n                 : out   std_logic;                                        
		memory_mem_cke                  : out   std_logic;                                        
		memory_mem_cs_n                 : out   std_logic;                                        
		memory_mem_ras_n                : out   std_logic;                                        
		memory_mem_cas_n                : out   std_logic;                                        
		memory_mem_we_n                 : out   std_logic;                                        
		memory_mem_reset_n              : out   std_logic;                                        
		memory_mem_dq                   : inout std_logic_vector(39 downto 0) := (others => '0'); 
		memory_mem_dqs                  : inout std_logic_vector(4 downto 0)  := (others => '0'); 
		memory_mem_dqs_n                : inout std_logic_vector(4 downto 0)  := (others => '0'); 
		memory_mem_odt                  : out   std_logic;                                        
		memory_mem_dm                   : out   std_logic_vector(4 downto 0);                     
		memory_oct_rzqin                : in    std_logic                     := '0';             

		h2f_bus_awid                    : out   std_logic_vector(11 downto 0);                    --   h2f_bus.awid
		h2f_bus_awaddr                  : out   std_logic_vector(29 downto 0);                    --          .awaddr
		h2f_bus_awlen                   : out   std_logic_vector(7 downto 0);                     --          .awlen
		h2f_bus_awsize                  : out   std_logic_vector(2 downto 0);                     --          .awsize
		h2f_bus_awburst                 : out   std_logic_vector(1 downto 0);                     --          .awburst
		h2f_bus_awlock                  : out   std_logic_vector(0 downto 0);                     --          .awlock
		h2f_bus_awcache                 : out   std_logic_vector(3 downto 0);                     --          .awcache
		h2f_bus_awprot                  : out   std_logic_vector(2 downto 0);                     --          .awprot
		h2f_bus_awqos                   : out   std_logic_vector(3 downto 0);                     --          .awqos
		h2f_bus_awvalid                 : out   std_logic;                                        --          .awvalid
		h2f_bus_awready                 : in    std_logic                     := '0';             --          .awready
		h2f_bus_wdata                   : out   std_logic_vector(31 downto 0);                    --          .wdata
		h2f_bus_wstrb                   : out   std_logic_vector(3 downto 0);                     --          .wstrb
		h2f_bus_wlast                   : out   std_logic;                                        --          .wlast
		h2f_bus_wvalid                  : out   std_logic;                                        --          .wvalid
		h2f_bus_wready                  : in    std_logic                     := '0';             --          .wready
		h2f_bus_bid                     : in    std_logic_vector(11 downto 0) := (others => '0'); --          .bid
		h2f_bus_bresp                   : in    std_logic_vector(1 downto 0)  := (others => '0'); --          .bresp
		h2f_bus_bvalid                  : in    std_logic                     := '0';             --          .bvalid
		h2f_bus_bready                  : out   std_logic;                                        --          .bready
		h2f_bus_arid                    : out   std_logic_vector(11 downto 0);                    --          .arid
		h2f_bus_araddr                  : out   std_logic_vector(29 downto 0);                    --          .araddr
		h2f_bus_arlen                   : out   std_logic_vector(7 downto 0);                     --          .arlen
		h2f_bus_arsize                  : out   std_logic_vector(2 downto 0);                     --          .arsize
		h2f_bus_arburst                 : out   std_logic_vector(1 downto 0);                     --          .arburst
		h2f_bus_arlock                  : out   std_logic_vector(0 downto 0);                     --          .arlock
		h2f_bus_arcache                 : out   std_logic_vector(3 downto 0);                     --          .arcache
		h2f_bus_arprot                  : out   std_logic_vector(2 downto 0);                     --          .arprot
		h2f_bus_arqos                   : out   std_logic_vector(3 downto 0);                     --          .arqos
		h2f_bus_arvalid                 : out   std_logic;                                        --          .arvalid
		h2f_bus_arready                 : in    std_logic                     := '0';             --          .arready
		h2f_bus_rid                     : in    std_logic_vector(11 downto 0) := (others => '0'); --          .rid
		h2f_bus_rdata                   : in    std_logic_vector(31 downto 0) := (others => '0'); --          .rdata
		h2f_bus_rresp                   : in    std_logic_vector(1 downto 0)  := (others => '0'); --          .rresp
		h2f_bus_rlast                   : in    std_logic                     := '0';             --          .rlast
		h2f_bus_rvalid                  : in    std_logic                     := '0';             --          .rvalid
		h2f_bus_rready                  : out   std_logic;                                        --          .rready

		reset_reset_n                   : in    std_logic                     := '0'              
	);
  end component standalone_hps;
  component mainmap is
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
  end component mainmap;
end package golden_top_pkg;
