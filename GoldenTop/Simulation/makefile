# Makefile automatically generated by ghdl
# Version: GHDL 0.37-dev (v0.36-48-g031afa18) [Dunoon edition] - GCC back-end code generator
# Command used to generate this makefile:
# ghdl --gen-makefile --std=08 golden_top

GHDL=ghdl
GHDLFLAGS= --std=08

# Default target
all: golden_top

# Elaboration target
golden_top: /usr/lib/ghdl/std/v08/textio.o /usr/lib/ghdl/std/v08/textio-body.o /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/std_logic_1164-body.o /usr/lib/ghdl/ieee/v08/numeric_std.o /usr/lib/ghdl/ieee/v08/numeric_std-body.o golden_top_pkg.o genram_pkg.o wishbone_pkg.o axi4_pkg.o golden_top.o standalone_hps.o map.o
	$(GHDL) -e $(GHDLFLAGS) $@

# Run target
run: golden_top
	$(GHDL) -r golden_top $(GHDLRUNFLAGS)

# Targets to analyze files
/usr/lib/ghdl/std/v08/textio.o: /usr/lib/ghdl/std/v08/../../src/std/textio.v08
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/std/v08/textio-body.o: /usr/lib/ghdl/std/v08/../../src/std/textio-body.v08
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/ieee/v08/std_logic_1164.o: /usr/lib/ghdl/ieee/v08/../../src/ieee2008/std_logic_1164.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/ieee/v08/std_logic_1164-body.o: /usr/lib/ghdl/ieee/v08/../../src/ieee2008/std_logic_1164-body.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/ieee/v08/numeric_std.o: /usr/lib/ghdl/ieee/v08/../../src/ieee2008/numeric_std.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
/usr/lib/ghdl/ieee/v08/numeric_std-body.o: /usr/lib/ghdl/ieee/v08/../../src/ieee2008/numeric_std-body.vhdl
	@echo "This file was not locally built ($<)"
	exit 1
golden_top_pkg.o: ../Sources/golden_top_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
genram_pkg.o: ../Sources/genram_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
wishbone_pkg.o: ../Sources/wishbone_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
axi4_pkg.o: ../Sources/axi4_pkg.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
golden_top.o: ../Sources/golden_top.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
standalone_hps.o: ../Sources/standalone_hps/synthesis/standalone_hps.vhd
	$(GHDL) -a $(GHDLFLAGS) $<
map.o: ../MemMaps/map.vhd
	$(GHDL) -a $(GHDLFLAGS) $<

# Files dependences
/usr/lib/ghdl/std/v08/textio.o: 
/usr/lib/ghdl/std/v08/textio-body.o:  /usr/lib/ghdl/std/v08/textio.o
/usr/lib/ghdl/ieee/v08/std_logic_1164.o:  /usr/lib/ghdl/std/v08/textio.o /usr/lib/ghdl/std/v08/textio-body.o
/usr/lib/ghdl/ieee/v08/std_logic_1164-body.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o
/usr/lib/ghdl/ieee/v08/numeric_std.o:  /usr/lib/ghdl/std/v08/textio.o /usr/lib/ghdl/ieee/v08/std_logic_1164.o
/usr/lib/ghdl/ieee/v08/numeric_std-body.o:  /usr/lib/ghdl/ieee/v08/numeric_std.o
golden_top_pkg.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/numeric_std.o
genram_pkg.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/numeric_std.o
wishbone_pkg.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/numeric_std.o genram_pkg.o
axi4_pkg.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o wishbone_pkg.o
golden_top.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/std_logic_1164-body.o /usr/lib/ghdl/ieee/v08/numeric_std.o /usr/lib/ghdl/ieee/v08/numeric_std-body.o golden_top_pkg.o axi4_pkg.o
standalone_hps.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/numeric_std.o
map.o:  /usr/lib/ghdl/ieee/v08/std_logic_1164.o /usr/lib/ghdl/ieee/v08/numeric_std.o
