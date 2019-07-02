
module standalone_hps (
	buttons_i_export,
	clk_clk,
	dipsw_i_export,
	h2f_bus_awid,
	h2f_bus_awaddr,
	h2f_bus_awlen,
	h2f_bus_awsize,
	h2f_bus_awburst,
	h2f_bus_awlock,
	h2f_bus_awcache,
	h2f_bus_awprot,
	h2f_bus_awqos,
	h2f_bus_awvalid,
	h2f_bus_awready,
	h2f_bus_wdata,
	h2f_bus_wstrb,
	h2f_bus_wlast,
	h2f_bus_wvalid,
	h2f_bus_wready,
	h2f_bus_bid,
	h2f_bus_bresp,
	h2f_bus_bvalid,
	h2f_bus_bready,
	h2f_bus_arid,
	h2f_bus_araddr,
	h2f_bus_arlen,
	h2f_bus_arsize,
	h2f_bus_arburst,
	h2f_bus_arlock,
	h2f_bus_arcache,
	h2f_bus_arprot,
	h2f_bus_arqos,
	h2f_bus_arvalid,
	h2f_bus_arready,
	h2f_bus_rid,
	h2f_bus_rdata,
	h2f_bus_rresp,
	h2f_bus_rlast,
	h2f_bus_rvalid,
	h2f_bus_rready,
	h2f_reset_reset_n,
	hps_io_hps_io_emac1_inst_TX_CLK,
	hps_io_hps_io_emac1_inst_TXD0,
	hps_io_hps_io_emac1_inst_TXD1,
	hps_io_hps_io_emac1_inst_TXD2,
	hps_io_hps_io_emac1_inst_TXD3,
	hps_io_hps_io_emac1_inst_RXD0,
	hps_io_hps_io_emac1_inst_MDIO,
	hps_io_hps_io_emac1_inst_MDC,
	hps_io_hps_io_emac1_inst_RX_CTL,
	hps_io_hps_io_emac1_inst_TX_CTL,
	hps_io_hps_io_emac1_inst_RX_CLK,
	hps_io_hps_io_emac1_inst_RXD1,
	hps_io_hps_io_emac1_inst_RXD2,
	hps_io_hps_io_emac1_inst_RXD3,
	hps_io_hps_io_qspi_inst_IO0,
	hps_io_hps_io_qspi_inst_IO1,
	hps_io_hps_io_qspi_inst_IO2,
	hps_io_hps_io_qspi_inst_IO3,
	hps_io_hps_io_qspi_inst_SS0,
	hps_io_hps_io_qspi_inst_CLK,
	hps_io_hps_io_sdio_inst_CMD,
	hps_io_hps_io_sdio_inst_D0,
	hps_io_hps_io_sdio_inst_D1,
	hps_io_hps_io_sdio_inst_CLK,
	hps_io_hps_io_sdio_inst_D2,
	hps_io_hps_io_sdio_inst_D3,
	hps_io_hps_io_usb1_inst_D0,
	hps_io_hps_io_usb1_inst_D1,
	hps_io_hps_io_usb1_inst_D2,
	hps_io_hps_io_usb1_inst_D3,
	hps_io_hps_io_usb1_inst_D4,
	hps_io_hps_io_usb1_inst_D5,
	hps_io_hps_io_usb1_inst_D6,
	hps_io_hps_io_usb1_inst_D7,
	hps_io_hps_io_usb1_inst_CLK,
	hps_io_hps_io_usb1_inst_STP,
	hps_io_hps_io_usb1_inst_DIR,
	hps_io_hps_io_usb1_inst_NXT,
	hps_io_hps_io_spim0_inst_CLK,
	hps_io_hps_io_spim0_inst_MOSI,
	hps_io_hps_io_spim0_inst_MISO,
	hps_io_hps_io_spim0_inst_SS0,
	hps_io_hps_io_uart0_inst_RX,
	hps_io_hps_io_uart0_inst_TX,
	hps_io_hps_io_i2c0_inst_SDA,
	hps_io_hps_io_i2c0_inst_SCL,
	hps_io_hps_io_can0_inst_RX,
	hps_io_hps_io_can0_inst_TX,
	hps_io_hps_io_trace_inst_CLK,
	hps_io_hps_io_trace_inst_D0,
	hps_io_hps_io_trace_inst_D1,
	hps_io_hps_io_trace_inst_D2,
	hps_io_hps_io_trace_inst_D3,
	hps_io_hps_io_trace_inst_D4,
	hps_io_hps_io_trace_inst_D5,
	hps_io_hps_io_trace_inst_D6,
	hps_io_hps_io_trace_inst_D7,
	leds_o_export,
	memory_mem_a,
	memory_mem_ba,
	memory_mem_ck,
	memory_mem_ck_n,
	memory_mem_cke,
	memory_mem_cs_n,
	memory_mem_ras_n,
	memory_mem_cas_n,
	memory_mem_we_n,
	memory_mem_reset_n,
	memory_mem_dq,
	memory_mem_dqs,
	memory_mem_dqs_n,
	memory_mem_odt,
	memory_mem_dm,
	memory_oct_rzqin,
	reset_reset_n);	

	input	[3:0]	buttons_i_export;
	input		clk_clk;
	input	[3:0]	dipsw_i_export;
	output	[11:0]	h2f_bus_awid;
	output	[29:0]	h2f_bus_awaddr;
	output	[7:0]	h2f_bus_awlen;
	output	[2:0]	h2f_bus_awsize;
	output	[1:0]	h2f_bus_awburst;
	output	[0:0]	h2f_bus_awlock;
	output	[3:0]	h2f_bus_awcache;
	output	[2:0]	h2f_bus_awprot;
	output	[3:0]	h2f_bus_awqos;
	output		h2f_bus_awvalid;
	input		h2f_bus_awready;
	output	[31:0]	h2f_bus_wdata;
	output	[3:0]	h2f_bus_wstrb;
	output		h2f_bus_wlast;
	output		h2f_bus_wvalid;
	input		h2f_bus_wready;
	input	[11:0]	h2f_bus_bid;
	input	[1:0]	h2f_bus_bresp;
	input		h2f_bus_bvalid;
	output		h2f_bus_bready;
	output	[11:0]	h2f_bus_arid;
	output	[29:0]	h2f_bus_araddr;
	output	[7:0]	h2f_bus_arlen;
	output	[2:0]	h2f_bus_arsize;
	output	[1:0]	h2f_bus_arburst;
	output	[0:0]	h2f_bus_arlock;
	output	[3:0]	h2f_bus_arcache;
	output	[2:0]	h2f_bus_arprot;
	output	[3:0]	h2f_bus_arqos;
	output		h2f_bus_arvalid;
	input		h2f_bus_arready;
	input	[11:0]	h2f_bus_rid;
	input	[31:0]	h2f_bus_rdata;
	input	[1:0]	h2f_bus_rresp;
	input		h2f_bus_rlast;
	input		h2f_bus_rvalid;
	output		h2f_bus_rready;
	output		h2f_reset_reset_n;
	output		hps_io_hps_io_emac1_inst_TX_CLK;
	output		hps_io_hps_io_emac1_inst_TXD0;
	output		hps_io_hps_io_emac1_inst_TXD1;
	output		hps_io_hps_io_emac1_inst_TXD2;
	output		hps_io_hps_io_emac1_inst_TXD3;
	input		hps_io_hps_io_emac1_inst_RXD0;
	inout		hps_io_hps_io_emac1_inst_MDIO;
	output		hps_io_hps_io_emac1_inst_MDC;
	input		hps_io_hps_io_emac1_inst_RX_CTL;
	output		hps_io_hps_io_emac1_inst_TX_CTL;
	input		hps_io_hps_io_emac1_inst_RX_CLK;
	input		hps_io_hps_io_emac1_inst_RXD1;
	input		hps_io_hps_io_emac1_inst_RXD2;
	input		hps_io_hps_io_emac1_inst_RXD3;
	inout		hps_io_hps_io_qspi_inst_IO0;
	inout		hps_io_hps_io_qspi_inst_IO1;
	inout		hps_io_hps_io_qspi_inst_IO2;
	inout		hps_io_hps_io_qspi_inst_IO3;
	output		hps_io_hps_io_qspi_inst_SS0;
	output		hps_io_hps_io_qspi_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_CMD;
	inout		hps_io_hps_io_sdio_inst_D0;
	inout		hps_io_hps_io_sdio_inst_D1;
	output		hps_io_hps_io_sdio_inst_CLK;
	inout		hps_io_hps_io_sdio_inst_D2;
	inout		hps_io_hps_io_sdio_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D0;
	inout		hps_io_hps_io_usb1_inst_D1;
	inout		hps_io_hps_io_usb1_inst_D2;
	inout		hps_io_hps_io_usb1_inst_D3;
	inout		hps_io_hps_io_usb1_inst_D4;
	inout		hps_io_hps_io_usb1_inst_D5;
	inout		hps_io_hps_io_usb1_inst_D6;
	inout		hps_io_hps_io_usb1_inst_D7;
	input		hps_io_hps_io_usb1_inst_CLK;
	output		hps_io_hps_io_usb1_inst_STP;
	input		hps_io_hps_io_usb1_inst_DIR;
	input		hps_io_hps_io_usb1_inst_NXT;
	output		hps_io_hps_io_spim0_inst_CLK;
	output		hps_io_hps_io_spim0_inst_MOSI;
	input		hps_io_hps_io_spim0_inst_MISO;
	output		hps_io_hps_io_spim0_inst_SS0;
	input		hps_io_hps_io_uart0_inst_RX;
	output		hps_io_hps_io_uart0_inst_TX;
	inout		hps_io_hps_io_i2c0_inst_SDA;
	inout		hps_io_hps_io_i2c0_inst_SCL;
	input		hps_io_hps_io_can0_inst_RX;
	output		hps_io_hps_io_can0_inst_TX;
	output		hps_io_hps_io_trace_inst_CLK;
	output		hps_io_hps_io_trace_inst_D0;
	output		hps_io_hps_io_trace_inst_D1;
	output		hps_io_hps_io_trace_inst_D2;
	output		hps_io_hps_io_trace_inst_D3;
	output		hps_io_hps_io_trace_inst_D4;
	output		hps_io_hps_io_trace_inst_D5;
	output		hps_io_hps_io_trace_inst_D6;
	output		hps_io_hps_io_trace_inst_D7;
	output	[3:0]	leds_o_export;
	output	[14:0]	memory_mem_a;
	output	[2:0]	memory_mem_ba;
	output		memory_mem_ck;
	output		memory_mem_ck_n;
	output		memory_mem_cke;
	output		memory_mem_cs_n;
	output		memory_mem_ras_n;
	output		memory_mem_cas_n;
	output		memory_mem_we_n;
	output		memory_mem_reset_n;
	inout	[39:0]	memory_mem_dq;
	inout	[4:0]	memory_mem_dqs;
	inout	[4:0]	memory_mem_dqs_n;
	output		memory_mem_odt;
	output	[4:0]	memory_mem_dm;
	input		memory_oct_rzqin;
	input		reset_reset_n;
endmodule
