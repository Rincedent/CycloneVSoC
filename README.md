# Cyclone V SoC Dev Kit Project
## Description
The goal of the project is to use Quartus Qsys (Platform Designer 
since 18.1) to describe a simple HPS architecture (using the default 
settings provided by Altera in cv_soc_devkit_ghrd), and use this HPS
in a top level design in pure VHDL (and then using the Platform Designer
interface as little as possible).

The VHDL sources are in the GoldenTop/Sources folder, as is the 
standalone_hps.qsys describing the Platform Designer HPS system.

## Folders architecture
* `GoldenTop` : Contains the Quartus project and the VHDL sources
* `Outputs` : various binary files necessary to flash the design
* `linux-socfpga` : linux kernel sources


## Build process
1. Open the quartus project in GoldenTop/Work/soc_system.qsf
2. Open the GoldenTop/Sources/standalone_hps.qsys file using the 
   platform designer
3. Generate HDL in the plaform designer
4. Close the Platform Designer, then compile the project using Quartus
5. Once everything is synthesized, run the ./make.sh script at the root
   of the project from an embedded command shell (you need the soc-eds
   software from altera :  http://fpgasoftware.intel.com/soceds/)
   * **`NOTE` : You should run the script twice the first time, then
   only once per synthesis because the auto-generated toolchain needs
   to be altered.**
6. Follow the "Prepare SD card" paragraph using the files that just got
   generated in the outputs/ folder

## Linux kernel
The Sources for the linux kernel are in the linux-socfpga submodule. To
recompile the kernel :

```bash
git submodule update --init
cd linux-socfpga
# Set up the cross-compiler options 
export CROSS_COMPILE=arm-linux-gnueabihf-
export ARCH=arm
# Edit configs/modules needed
make menuconfig 
# Build the zImage
make zImage -j8
# Export the zImage
cp arch/arm/boot/zImage ../Outputs
```


## Useful links
The HPS system boots first using uBoot, then a linux. The sources of the
linux are on the following link:
* https://github.com/altera-opensource/linux-socfpga

The tag from which the zImage was generated from is the following :
* `ACDS19.1_REL_GSRD_PR`

The cv_soc_devkit_ghrd files were taken from the following link :
* https://releases.rocketboards.org/release/2014.09/gsrd/ghrd/

The Presets for the Cyclone V dev kit board in Qsys (Platform Designer)
were downloaded from the following link :
* https://www.intel.com/content/www/us/en/programmable/support/support-resources/knowledge-base/solutions/rd05212014_438.html
