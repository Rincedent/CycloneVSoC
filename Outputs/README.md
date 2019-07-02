# Design outputs
* `boot-partition.img`: contains the uboot image concatenated with the 
  preloader binaries
* `zImage`: linux kernel image
* `socfpga.dts` : linux device tree file (generated from GoldenTop/Work/standalone_hps.sopcinfo)
* `socfpga.dtb` : device tree blob (generated from socfpga.dts)
* `soc_system.rbf` : FPGA bitstream file, generated from 
  GoldenTop/Work/output_files/soc_system.sof using quartus_cpf 
  command (embedded command shell)
