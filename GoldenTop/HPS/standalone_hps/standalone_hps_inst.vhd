	component standalone_hps is
		port (
			buttons_i_export                : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			clk_clk                         : in    std_logic                     := 'X';             -- clk
			dipsw_i_export                  : in    std_logic_vector(3 downto 0)  := (others => 'X'); -- export
			h2f_bus_awid                    : out   std_logic_vector(11 downto 0);                    -- awid
			h2f_bus_awaddr                  : out   std_logic_vector(29 downto 0);                    -- awaddr
			h2f_bus_awlen                   : out   std_logic_vector(7 downto 0);                     -- awlen
			h2f_bus_awsize                  : out   std_logic_vector(2 downto 0);                     -- awsize
			h2f_bus_awburst                 : out   std_logic_vector(1 downto 0);                     -- awburst
			h2f_bus_awlock                  : out   std_logic_vector(0 downto 0);                     -- awlock
			h2f_bus_awcache                 : out   std_logic_vector(3 downto 0);                     -- awcache
			h2f_bus_awprot                  : out   std_logic_vector(2 downto 0);                     -- awprot
			h2f_bus_awqos                   : out   std_logic_vector(3 downto 0);                     -- awqos
			h2f_bus_awvalid                 : out   std_logic;                                        -- awvalid
			h2f_bus_awready                 : in    std_logic                     := 'X';             -- awready
			h2f_bus_wdata                   : out   std_logic_vector(31 downto 0);                    -- wdata
			h2f_bus_wstrb                   : out   std_logic_vector(3 downto 0);                     -- wstrb
			h2f_bus_wlast                   : out   std_logic;                                        -- wlast
			h2f_bus_wvalid                  : out   std_logic;                                        -- wvalid
			h2f_bus_wready                  : in    std_logic                     := 'X';             -- wready
			h2f_bus_bid                     : in    std_logic_vector(11 downto 0) := (others => 'X'); -- bid
			h2f_bus_bresp                   : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- bresp
			h2f_bus_bvalid                  : in    std_logic                     := 'X';             -- bvalid
			h2f_bus_bready                  : out   std_logic;                                        -- bready
			h2f_bus_arid                    : out   std_logic_vector(11 downto 0);                    -- arid
			h2f_bus_araddr                  : out   std_logic_vector(29 downto 0);                    -- araddr
			h2f_bus_arlen                   : out   std_logic_vector(7 downto 0);                     -- arlen
			h2f_bus_arsize                  : out   std_logic_vector(2 downto 0);                     -- arsize
			h2f_bus_arburst                 : out   std_logic_vector(1 downto 0);                     -- arburst
			h2f_bus_arlock                  : out   std_logic_vector(0 downto 0);                     -- arlock
			h2f_bus_arcache                 : out   std_logic_vector(3 downto 0);                     -- arcache
			h2f_bus_arprot                  : out   std_logic_vector(2 downto 0);                     -- arprot
			h2f_bus_arqos                   : out   std_logic_vector(3 downto 0);                     -- arqos
			h2f_bus_arvalid                 : out   std_logic;                                        -- arvalid
			h2f_bus_arready                 : in    std_logic                     := 'X';             -- arready
			h2f_bus_rid                     : in    std_logic_vector(11 downto 0) := (others => 'X'); -- rid
			h2f_bus_rdata                   : in    std_logic_vector(31 downto 0) := (others => 'X'); -- rdata
			h2f_bus_rresp                   : in    std_logic_vector(1 downto 0)  := (others => 'X'); -- rresp
			h2f_bus_rlast                   : in    std_logic                     := 'X';             -- rlast
			h2f_bus_rvalid                  : in    std_logic                     := 'X';             -- rvalid
			h2f_bus_rready                  : out   std_logic;                                        -- rready
			h2f_reset_reset_n               : out   std_logic;                                        -- reset_n
			hps_io_hps_io_emac1_inst_TX_CLK : out   std_logic;                                        -- hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0   : out   std_logic;                                        -- hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1   : out   std_logic;                                        -- hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2   : out   std_logic;                                        -- hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3   : out   std_logic;                                        -- hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO   : inout std_logic                     := 'X';             -- hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC    : out   std_logic;                                        -- hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL : out   std_logic;                                        -- hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3   : in    std_logic                     := 'X';             -- hps_io_emac1_inst_RXD3
			hps_io_hps_io_qspi_inst_IO0     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3     : inout std_logic                     := 'X';             -- hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0     : out   std_logic;                                        -- hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK     : out   std_logic;                                        -- hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD     : inout std_logic                     := 'X';             -- hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK     : out   std_logic;                                        -- hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3      : inout std_logic                     := 'X';             -- hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7      : inout std_logic                     := 'X';             -- hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP     : out   std_logic;                                        -- hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT     : in    std_logic                     := 'X';             -- hps_io_usb1_inst_NXT
			hps_io_hps_io_spim0_inst_CLK    : out   std_logic;                                        -- hps_io_spim0_inst_CLK
			hps_io_hps_io_spim0_inst_MOSI   : out   std_logic;                                        -- hps_io_spim0_inst_MOSI
			hps_io_hps_io_spim0_inst_MISO   : in    std_logic                     := 'X';             -- hps_io_spim0_inst_MISO
			hps_io_hps_io_spim0_inst_SS0    : out   std_logic;                                        -- hps_io_spim0_inst_SS0
			hps_io_hps_io_uart0_inst_RX     : in    std_logic                     := 'X';             -- hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX     : out   std_logic;                                        -- hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA     : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL     : inout std_logic                     := 'X';             -- hps_io_i2c0_inst_SCL
			hps_io_hps_io_can0_inst_RX      : in    std_logic                     := 'X';             -- hps_io_can0_inst_RX
			hps_io_hps_io_can0_inst_TX      : out   std_logic;                                        -- hps_io_can0_inst_TX
			hps_io_hps_io_trace_inst_CLK    : out   std_logic;                                        -- hps_io_trace_inst_CLK
			hps_io_hps_io_trace_inst_D0     : out   std_logic;                                        -- hps_io_trace_inst_D0
			hps_io_hps_io_trace_inst_D1     : out   std_logic;                                        -- hps_io_trace_inst_D1
			hps_io_hps_io_trace_inst_D2     : out   std_logic;                                        -- hps_io_trace_inst_D2
			hps_io_hps_io_trace_inst_D3     : out   std_logic;                                        -- hps_io_trace_inst_D3
			hps_io_hps_io_trace_inst_D4     : out   std_logic;                                        -- hps_io_trace_inst_D4
			hps_io_hps_io_trace_inst_D5     : out   std_logic;                                        -- hps_io_trace_inst_D5
			hps_io_hps_io_trace_inst_D6     : out   std_logic;                                        -- hps_io_trace_inst_D6
			hps_io_hps_io_trace_inst_D7     : out   std_logic;                                        -- hps_io_trace_inst_D7
			leds_o_export                   : out   std_logic_vector(3 downto 0);                     -- export
			memory_mem_a                    : out   std_logic_vector(14 downto 0);                    -- mem_a
			memory_mem_ba                   : out   std_logic_vector(2 downto 0);                     -- mem_ba
			memory_mem_ck                   : out   std_logic;                                        -- mem_ck
			memory_mem_ck_n                 : out   std_logic;                                        -- mem_ck_n
			memory_mem_cke                  : out   std_logic;                                        -- mem_cke
			memory_mem_cs_n                 : out   std_logic;                                        -- mem_cs_n
			memory_mem_ras_n                : out   std_logic;                                        -- mem_ras_n
			memory_mem_cas_n                : out   std_logic;                                        -- mem_cas_n
			memory_mem_we_n                 : out   std_logic;                                        -- mem_we_n
			memory_mem_reset_n              : out   std_logic;                                        -- mem_reset_n
			memory_mem_dq                   : inout std_logic_vector(39 downto 0) := (others => 'X'); -- mem_dq
			memory_mem_dqs                  : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs
			memory_mem_dqs_n                : inout std_logic_vector(4 downto 0)  := (others => 'X'); -- mem_dqs_n
			memory_mem_odt                  : out   std_logic;                                        -- mem_odt
			memory_mem_dm                   : out   std_logic_vector(4 downto 0);                     -- mem_dm
			memory_oct_rzqin                : in    std_logic                     := 'X';             -- oct_rzqin
			reset_reset_n                   : in    std_logic                     := 'X'              -- reset_n
		);
	end component standalone_hps;

	u0 : component standalone_hps
		port map (
			buttons_i_export                => CONNECTED_TO_buttons_i_export,                -- buttons_i.export
			clk_clk                         => CONNECTED_TO_clk_clk,                         --       clk.clk
			dipsw_i_export                  => CONNECTED_TO_dipsw_i_export,                  --   dipsw_i.export
			h2f_bus_awid                    => CONNECTED_TO_h2f_bus_awid,                    --   h2f_bus.awid
			h2f_bus_awaddr                  => CONNECTED_TO_h2f_bus_awaddr,                  --          .awaddr
			h2f_bus_awlen                   => CONNECTED_TO_h2f_bus_awlen,                   --          .awlen
			h2f_bus_awsize                  => CONNECTED_TO_h2f_bus_awsize,                  --          .awsize
			h2f_bus_awburst                 => CONNECTED_TO_h2f_bus_awburst,                 --          .awburst
			h2f_bus_awlock                  => CONNECTED_TO_h2f_bus_awlock,                  --          .awlock
			h2f_bus_awcache                 => CONNECTED_TO_h2f_bus_awcache,                 --          .awcache
			h2f_bus_awprot                  => CONNECTED_TO_h2f_bus_awprot,                  --          .awprot
			h2f_bus_awqos                   => CONNECTED_TO_h2f_bus_awqos,                   --          .awqos
			h2f_bus_awvalid                 => CONNECTED_TO_h2f_bus_awvalid,                 --          .awvalid
			h2f_bus_awready                 => CONNECTED_TO_h2f_bus_awready,                 --          .awready
			h2f_bus_wdata                   => CONNECTED_TO_h2f_bus_wdata,                   --          .wdata
			h2f_bus_wstrb                   => CONNECTED_TO_h2f_bus_wstrb,                   --          .wstrb
			h2f_bus_wlast                   => CONNECTED_TO_h2f_bus_wlast,                   --          .wlast
			h2f_bus_wvalid                  => CONNECTED_TO_h2f_bus_wvalid,                  --          .wvalid
			h2f_bus_wready                  => CONNECTED_TO_h2f_bus_wready,                  --          .wready
			h2f_bus_bid                     => CONNECTED_TO_h2f_bus_bid,                     --          .bid
			h2f_bus_bresp                   => CONNECTED_TO_h2f_bus_bresp,                   --          .bresp
			h2f_bus_bvalid                  => CONNECTED_TO_h2f_bus_bvalid,                  --          .bvalid
			h2f_bus_bready                  => CONNECTED_TO_h2f_bus_bready,                  --          .bready
			h2f_bus_arid                    => CONNECTED_TO_h2f_bus_arid,                    --          .arid
			h2f_bus_araddr                  => CONNECTED_TO_h2f_bus_araddr,                  --          .araddr
			h2f_bus_arlen                   => CONNECTED_TO_h2f_bus_arlen,                   --          .arlen
			h2f_bus_arsize                  => CONNECTED_TO_h2f_bus_arsize,                  --          .arsize
			h2f_bus_arburst                 => CONNECTED_TO_h2f_bus_arburst,                 --          .arburst
			h2f_bus_arlock                  => CONNECTED_TO_h2f_bus_arlock,                  --          .arlock
			h2f_bus_arcache                 => CONNECTED_TO_h2f_bus_arcache,                 --          .arcache
			h2f_bus_arprot                  => CONNECTED_TO_h2f_bus_arprot,                  --          .arprot
			h2f_bus_arqos                   => CONNECTED_TO_h2f_bus_arqos,                   --          .arqos
			h2f_bus_arvalid                 => CONNECTED_TO_h2f_bus_arvalid,                 --          .arvalid
			h2f_bus_arready                 => CONNECTED_TO_h2f_bus_arready,                 --          .arready
			h2f_bus_rid                     => CONNECTED_TO_h2f_bus_rid,                     --          .rid
			h2f_bus_rdata                   => CONNECTED_TO_h2f_bus_rdata,                   --          .rdata
			h2f_bus_rresp                   => CONNECTED_TO_h2f_bus_rresp,                   --          .rresp
			h2f_bus_rlast                   => CONNECTED_TO_h2f_bus_rlast,                   --          .rlast
			h2f_bus_rvalid                  => CONNECTED_TO_h2f_bus_rvalid,                  --          .rvalid
			h2f_bus_rready                  => CONNECTED_TO_h2f_bus_rready,                  --          .rready
			h2f_reset_reset_n               => CONNECTED_TO_h2f_reset_reset_n,               -- h2f_reset.reset_n
			hps_io_hps_io_emac1_inst_TX_CLK => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CLK, --    hps_io.hps_io_emac1_inst_TX_CLK
			hps_io_hps_io_emac1_inst_TXD0   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD0,   --          .hps_io_emac1_inst_TXD0
			hps_io_hps_io_emac1_inst_TXD1   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD1,   --          .hps_io_emac1_inst_TXD1
			hps_io_hps_io_emac1_inst_TXD2   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD2,   --          .hps_io_emac1_inst_TXD2
			hps_io_hps_io_emac1_inst_TXD3   => CONNECTED_TO_hps_io_hps_io_emac1_inst_TXD3,   --          .hps_io_emac1_inst_TXD3
			hps_io_hps_io_emac1_inst_RXD0   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD0,   --          .hps_io_emac1_inst_RXD0
			hps_io_hps_io_emac1_inst_MDIO   => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDIO,   --          .hps_io_emac1_inst_MDIO
			hps_io_hps_io_emac1_inst_MDC    => CONNECTED_TO_hps_io_hps_io_emac1_inst_MDC,    --          .hps_io_emac1_inst_MDC
			hps_io_hps_io_emac1_inst_RX_CTL => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CTL, --          .hps_io_emac1_inst_RX_CTL
			hps_io_hps_io_emac1_inst_TX_CTL => CONNECTED_TO_hps_io_hps_io_emac1_inst_TX_CTL, --          .hps_io_emac1_inst_TX_CTL
			hps_io_hps_io_emac1_inst_RX_CLK => CONNECTED_TO_hps_io_hps_io_emac1_inst_RX_CLK, --          .hps_io_emac1_inst_RX_CLK
			hps_io_hps_io_emac1_inst_RXD1   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD1,   --          .hps_io_emac1_inst_RXD1
			hps_io_hps_io_emac1_inst_RXD2   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD2,   --          .hps_io_emac1_inst_RXD2
			hps_io_hps_io_emac1_inst_RXD3   => CONNECTED_TO_hps_io_hps_io_emac1_inst_RXD3,   --          .hps_io_emac1_inst_RXD3
			hps_io_hps_io_qspi_inst_IO0     => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO0,     --          .hps_io_qspi_inst_IO0
			hps_io_hps_io_qspi_inst_IO1     => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO1,     --          .hps_io_qspi_inst_IO1
			hps_io_hps_io_qspi_inst_IO2     => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO2,     --          .hps_io_qspi_inst_IO2
			hps_io_hps_io_qspi_inst_IO3     => CONNECTED_TO_hps_io_hps_io_qspi_inst_IO3,     --          .hps_io_qspi_inst_IO3
			hps_io_hps_io_qspi_inst_SS0     => CONNECTED_TO_hps_io_hps_io_qspi_inst_SS0,     --          .hps_io_qspi_inst_SS0
			hps_io_hps_io_qspi_inst_CLK     => CONNECTED_TO_hps_io_hps_io_qspi_inst_CLK,     --          .hps_io_qspi_inst_CLK
			hps_io_hps_io_sdio_inst_CMD     => CONNECTED_TO_hps_io_hps_io_sdio_inst_CMD,     --          .hps_io_sdio_inst_CMD
			hps_io_hps_io_sdio_inst_D0      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D0,      --          .hps_io_sdio_inst_D0
			hps_io_hps_io_sdio_inst_D1      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D1,      --          .hps_io_sdio_inst_D1
			hps_io_hps_io_sdio_inst_CLK     => CONNECTED_TO_hps_io_hps_io_sdio_inst_CLK,     --          .hps_io_sdio_inst_CLK
			hps_io_hps_io_sdio_inst_D2      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D2,      --          .hps_io_sdio_inst_D2
			hps_io_hps_io_sdio_inst_D3      => CONNECTED_TO_hps_io_hps_io_sdio_inst_D3,      --          .hps_io_sdio_inst_D3
			hps_io_hps_io_usb1_inst_D0      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D0,      --          .hps_io_usb1_inst_D0
			hps_io_hps_io_usb1_inst_D1      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D1,      --          .hps_io_usb1_inst_D1
			hps_io_hps_io_usb1_inst_D2      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D2,      --          .hps_io_usb1_inst_D2
			hps_io_hps_io_usb1_inst_D3      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D3,      --          .hps_io_usb1_inst_D3
			hps_io_hps_io_usb1_inst_D4      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D4,      --          .hps_io_usb1_inst_D4
			hps_io_hps_io_usb1_inst_D5      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D5,      --          .hps_io_usb1_inst_D5
			hps_io_hps_io_usb1_inst_D6      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D6,      --          .hps_io_usb1_inst_D6
			hps_io_hps_io_usb1_inst_D7      => CONNECTED_TO_hps_io_hps_io_usb1_inst_D7,      --          .hps_io_usb1_inst_D7
			hps_io_hps_io_usb1_inst_CLK     => CONNECTED_TO_hps_io_hps_io_usb1_inst_CLK,     --          .hps_io_usb1_inst_CLK
			hps_io_hps_io_usb1_inst_STP     => CONNECTED_TO_hps_io_hps_io_usb1_inst_STP,     --          .hps_io_usb1_inst_STP
			hps_io_hps_io_usb1_inst_DIR     => CONNECTED_TO_hps_io_hps_io_usb1_inst_DIR,     --          .hps_io_usb1_inst_DIR
			hps_io_hps_io_usb1_inst_NXT     => CONNECTED_TO_hps_io_hps_io_usb1_inst_NXT,     --          .hps_io_usb1_inst_NXT
			hps_io_hps_io_spim0_inst_CLK    => CONNECTED_TO_hps_io_hps_io_spim0_inst_CLK,    --          .hps_io_spim0_inst_CLK
			hps_io_hps_io_spim0_inst_MOSI   => CONNECTED_TO_hps_io_hps_io_spim0_inst_MOSI,   --          .hps_io_spim0_inst_MOSI
			hps_io_hps_io_spim0_inst_MISO   => CONNECTED_TO_hps_io_hps_io_spim0_inst_MISO,   --          .hps_io_spim0_inst_MISO
			hps_io_hps_io_spim0_inst_SS0    => CONNECTED_TO_hps_io_hps_io_spim0_inst_SS0,    --          .hps_io_spim0_inst_SS0
			hps_io_hps_io_uart0_inst_RX     => CONNECTED_TO_hps_io_hps_io_uart0_inst_RX,     --          .hps_io_uart0_inst_RX
			hps_io_hps_io_uart0_inst_TX     => CONNECTED_TO_hps_io_hps_io_uart0_inst_TX,     --          .hps_io_uart0_inst_TX
			hps_io_hps_io_i2c0_inst_SDA     => CONNECTED_TO_hps_io_hps_io_i2c0_inst_SDA,     --          .hps_io_i2c0_inst_SDA
			hps_io_hps_io_i2c0_inst_SCL     => CONNECTED_TO_hps_io_hps_io_i2c0_inst_SCL,     --          .hps_io_i2c0_inst_SCL
			hps_io_hps_io_can0_inst_RX      => CONNECTED_TO_hps_io_hps_io_can0_inst_RX,      --          .hps_io_can0_inst_RX
			hps_io_hps_io_can0_inst_TX      => CONNECTED_TO_hps_io_hps_io_can0_inst_TX,      --          .hps_io_can0_inst_TX
			hps_io_hps_io_trace_inst_CLK    => CONNECTED_TO_hps_io_hps_io_trace_inst_CLK,    --          .hps_io_trace_inst_CLK
			hps_io_hps_io_trace_inst_D0     => CONNECTED_TO_hps_io_hps_io_trace_inst_D0,     --          .hps_io_trace_inst_D0
			hps_io_hps_io_trace_inst_D1     => CONNECTED_TO_hps_io_hps_io_trace_inst_D1,     --          .hps_io_trace_inst_D1
			hps_io_hps_io_trace_inst_D2     => CONNECTED_TO_hps_io_hps_io_trace_inst_D2,     --          .hps_io_trace_inst_D2
			hps_io_hps_io_trace_inst_D3     => CONNECTED_TO_hps_io_hps_io_trace_inst_D3,     --          .hps_io_trace_inst_D3
			hps_io_hps_io_trace_inst_D4     => CONNECTED_TO_hps_io_hps_io_trace_inst_D4,     --          .hps_io_trace_inst_D4
			hps_io_hps_io_trace_inst_D5     => CONNECTED_TO_hps_io_hps_io_trace_inst_D5,     --          .hps_io_trace_inst_D5
			hps_io_hps_io_trace_inst_D6     => CONNECTED_TO_hps_io_hps_io_trace_inst_D6,     --          .hps_io_trace_inst_D6
			hps_io_hps_io_trace_inst_D7     => CONNECTED_TO_hps_io_hps_io_trace_inst_D7,     --          .hps_io_trace_inst_D7
			leds_o_export                   => CONNECTED_TO_leds_o_export,                   --    leds_o.export
			memory_mem_a                    => CONNECTED_TO_memory_mem_a,                    --    memory.mem_a
			memory_mem_ba                   => CONNECTED_TO_memory_mem_ba,                   --          .mem_ba
			memory_mem_ck                   => CONNECTED_TO_memory_mem_ck,                   --          .mem_ck
			memory_mem_ck_n                 => CONNECTED_TO_memory_mem_ck_n,                 --          .mem_ck_n
			memory_mem_cke                  => CONNECTED_TO_memory_mem_cke,                  --          .mem_cke
			memory_mem_cs_n                 => CONNECTED_TO_memory_mem_cs_n,                 --          .mem_cs_n
			memory_mem_ras_n                => CONNECTED_TO_memory_mem_ras_n,                --          .mem_ras_n
			memory_mem_cas_n                => CONNECTED_TO_memory_mem_cas_n,                --          .mem_cas_n
			memory_mem_we_n                 => CONNECTED_TO_memory_mem_we_n,                 --          .mem_we_n
			memory_mem_reset_n              => CONNECTED_TO_memory_mem_reset_n,              --          .mem_reset_n
			memory_mem_dq                   => CONNECTED_TO_memory_mem_dq,                   --          .mem_dq
			memory_mem_dqs                  => CONNECTED_TO_memory_mem_dqs,                  --          .mem_dqs
			memory_mem_dqs_n                => CONNECTED_TO_memory_mem_dqs_n,                --          .mem_dqs_n
			memory_mem_odt                  => CONNECTED_TO_memory_mem_odt,                  --          .mem_odt
			memory_mem_dm                   => CONNECTED_TO_memory_mem_dm,                   --          .mem_dm
			memory_oct_rzqin                => CONNECTED_TO_memory_oct_rzqin,                --          .oct_rzqin
			reset_reset_n                   => CONNECTED_TO_reset_reset_n                    --     reset.reset_n
		);

