-------------------------------------------------------------------------------
--
-- Description : Testbench procedures for axi stims generation
--
-- Author : Nathan Pittet
--
-- Date : 16.04.2019
--
-------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

use work.axi4_pkg.all;

package axi4_proc_pkg is
  procedure rd_axi(addr : integer;
                   signal axi_mi : in t_axi4_lite_master_in_32;
                   signal axi_mo : out t_axi4_lite_master_out_32;
                   signal clk : in std_logic;
                   clk_period : time
                 ); 

  procedure wr_axi( addr : integer;
                    value : integer;
                    signal axi_mi : in t_axi4_lite_master_in_32;
                    signal axi_mo : out t_axi4_lite_master_out_32;
                    signal clk : in std_logic;
                    clk_period : time
                  );
end package;

package body axi4_proc_pkg is

  procedure axi_handshake (signal sig_in : in std_logic;
                           signal sig_out : out std_logic;
                           clk_period : time) is
  begin
    sig_out <= '1';
    if sig_in = '0' then
      wait until sig_in = '1';
      wait for clk_period*2;
    else
      wait for clk_period*2;
    end if;
    
    sig_out <= '0';
  end procedure axi_handshake;


  procedure rd_axi(addr : integer;
                   signal axi_mi : in t_axi4_lite_master_in_32;
                   signal axi_mo : out t_axi4_lite_master_out_32;
                   signal clk : in std_logic;
                   clk_period : time
                 ) is
  begin
    wait until rising_edge(clk);
    axi_mo.ARADDR <= std_logic_vector(to_unsigned(addr, axi_mo.ARADDR'length));
    axi_handshake(axi_mi.ARREADY, axi_mo.ARVALID, clk_period);

    axi_handshake(axi_mi.RVALID,axi_mo.RREADY, clk_period);
    report "R:"&integer'image(addr)&" = "&integer'image(to_integer(unsigned(axi_mi.RDATA)))
    severity note;
    --axi_handshake(axi_mi.BVALID, axi_mo.BREADY, clk_period);

  end procedure rd_axi;

  procedure wr_axi( addr : integer;
                    value : integer;
                    signal axi_mi : in t_axi4_lite_master_in_32;
                    signal axi_mo : out t_axi4_lite_master_out_32;
                    signal clk : in std_logic;
                    clk_period : time
                  ) is
  begin
    wait until rising_edge(clk);
    axi_mo.AWADDR <= std_logic_vector(to_unsigned(addr, axi_mo.AWADDR'length));

    axi_handshake(axi_mi.AWREADY, axi_mo.AWVALID, clk_period);

    axi_mo.WDATA <= std_logic_vector(to_unsigned(value, axi_mo.WDATA'length));
    axi_handshake(axi_mi.WREADY, axi_mo.WVALID, clk_period);
  

    report "W :"&integer'image(addr)&" = "&integer'image(value)
    severity note;


    axi_handshake(axi_mi.BVALID, axi_mo.BREADY, clk_period);
    --report "Return message : "& integer'image(to_integer(unsigned(b_message))) severity note;
    wait until rising_edge(clk);

  end procedure wr_axi;

end package body;
