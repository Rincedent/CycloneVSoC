bsp-create-settings --type spl --bsp-dir GoldenTop/BuildUboot \
  --preloader-settings-dir GoldenTop/Work/hps_isw_handoff/standalone_hps_hps_0 \
  --settings GoldenTop/BuildUboot/settings.bsp --set spl.boot.WATCHDOG_ENABLE false

make -C GoldenTop/BuildUboot -j8
make -C GoldenTop/BuildUboot uboot -j8

cat GoldenTop/BuildUboot/preloader-mkpimage.bin GoldenTop/BuildUboot/uboot-socfpga/u-boot.img > outputs/boot-partition.img

quartus_cpf -c GoldenTop/Work/output_files/soc_system.sof outputs/soc_system.rbf

sopc2dts --input GoldenTop/Work/standalone_hps.sopcinfo --output outputs/socfpga.dts --type dts --board ./cv_soc_devkit_ghrd/soc_system_board_info.xml --board ./cv_soc_devkit_ghrd/hps_common_board_info.xml --bridge-removal all --clocks

dtc -f -I dts -O dtb -o outputs/socfpga.dtb outputs/socfpga.dts
