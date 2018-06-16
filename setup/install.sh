sudo apt-get -y install subversion gcc texinfo patch libncurses5-dev zlibc zlib1g-dev libx11-dev libusb-dev libreadline6-dev mspdebug


#wget http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/exports/msp430-gcc-6.4.0.32_linux64.tar.bz2
wget http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/exports/msp430-gcc-7.3.1.24_linux64.tar.bz2
tar -xvf msp430-gcc-*_linux64.tar.bz2
#wget http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/exports/msp430-gcc-support-files-1.204.zip
wget http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSPGCC/latest/exports/msp430-gcc-support-files-1.205.zip
unzip msp430-gcc-support-files*

mkdir /opt/msp430
rsync -av --progress msp430-gcc-*_linux64/* /opt/msp430/msp430-gcc

rsync -av --progress msp430-gcc-support-files /opt/msp430/

# Driverlib
wget http://software-dl.ti.com/msp430/msp430_public_sw/mcu/msp430/MSP430_Driver_Library/latest/exports/msp430_driverlib_2_91_07_07.zip
unzip msp430_driverlib*
rsync -av --progress msp430_driverlib/* /opt/msp430/msp430-driverlib

echo "You need to either link or copy the cmake file for driverlib in the cmake folder to the root of driverlib"
