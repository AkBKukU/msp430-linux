# CMake toolchain file for MSP430 development
# by Shelby Jueden (AkBKukU)


# Force compiler due to required non-standard flags
INCLUDE(CMakeForceCompiler)

# Set CMAKE to cross compiling
set(CMAKE_SYSTEM_NAME Generic)

# Device name for the chip to compile
set( DEVICE "MSP430FR5969" CACHE STRING "Device part number")
string( TOLOWER ${DEVICE} DEVICE )
set( LINKER_SCRIPT "${DEVICE}.ld" )


# -- Envoironment Configuration --
set( MSP430_FILES "/opt/msp430" )

# Library Include Settings
set( INC_DRIVERLIB FALSE CACHE BOOL "Include DriverLib" )
set( INC_ENERGIA FALSE CACHE BOOL "Include Energia(Not Supported Yet)" )


# Add GCC files
set( GCC_DIR "${MSP430_FILES}/msp430-gcc" )
set( GCC_SUPPORT_DIR "${MSP430_FILES}/msp430-gcc-support-files" )


# TI Libraries
if( INC_DRIVERLIB ) 
	set( DRIVERLIB_DIR "${MSP430_FILES}/msp430-driverlib" )
endif()

if( INC_ENERGIA ) 
	#set( ENERGIA_DIR "${MSP430_FILES}/msp430-energia" )
endif()


# GCC Executables
CMAKE_FORCE_C_COMPILER("${GCC_DIR}/bin/msp430-elf-gcc" GNU)
CMAKE_FORCE_CXX_COMPILER( "${GCC_DIR}/bin/msp430-elf-g++" GNU)

# Do not use system compiler executables
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# Only use specified libs
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Compiler flags
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${LINKER_SCRIPT}" CACHE STRING "" FORCE )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mmcu=${DEVICE}" CACHE STRING "" FORCE )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -g -Wl,--gc-sections" CACHE STRING "" FORCE )

set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -O2 -D__${DEVICE}__ -mmcu=${DEVICE} -g -ffunction-sections" CACHE STRING "" FORCE )
set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fdata-sections -DDEPRECATED" CACHE STRING "" FORCE )

set( CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -O2 -D__${DEVICE}__ -mmcu=${DEVICE} -g -ffunction-sections" CACHE STRING "" FORCE )
set( CMAKE_C_FLAGS  "${CMAKE_C_FLAGS} -fdata-sections -DDEPRECATED" CACHE STRING "" FORCE )



# include directories
# TODO - add optional energia support
include_directories( "${GCC_DIR}/msp430-elf/include" )
include_directories( "${GCC_SUPPORT_DIR}/include" )
link_directories( "${GCC_SUPPORT_DIR}/include" )

# TI Libraries
if( INC_ENERGIA ) 
	#include_directories( "${ENERGIA_DIR}" )
	#link_directories( "${ENERGIA_DIR}" )
endif()

