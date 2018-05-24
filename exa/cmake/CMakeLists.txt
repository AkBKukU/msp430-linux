# CMake file for MSP430 development
# by Shelby Jueden (AkBKukU)

# Set CMAKE to cross compiling
set(CMAKE_SYSTEM_NAME Generic)
cmake_minimum_required(VERSION 3.1)

# -- Project Configuration --
project(MSP430Test)

# Set name of ouput binary. 
set( BIN_NAME msp430test )

# Device name for the chip to compile
set( DEVICE MSP430FR5969 )

# Add all files from a src folder
file(GLOB SOURCES "src/*.cpp")


# -- Envoironment Configuration --

# Add TI dependencies assuming directories in opt
set( GCC_DIR "/opt/msp430/msp430-gcc" )
set( GCC_SUPPORT_DIR "/opt/msp430/msp430-gcc-support-files" )


# -- Compiling Configuration --
# TODO - Seperate toolchain file for this

# Executables
set( GCC_BIN_DIR "${GCC_DIR}/bin" )
set(CMAKE_C_COMPILER "${GCC_BIN_DIR}/msp430-elf-gcc" )
set(CMAKE_CXX_COMPILER "${GCC_BIN_DIR}/msp430-elf-g++" )

# include directories
# TODO - add optional driverlib support
# TODO - add optional energia support
include_directories( "${GCC_DIR}/msp430-elf/include" )
include_directories( "${GCC_SUPPORT_DIR}/include" )

string( TOLOWER ${DEVICE} DEVICE )
set( LINKER_SCRIPT "${DEVICE}.ld" )
link_directories( "${GCC_SUPPORT_DIR}/include" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${LINKER_SCRIPT}" )
set_target_properties( ${BIN_NAME} PROPERTIES LINK_DEPENDS ${LINKER_SCRIP} )


# Flags for debug build
set(
	CMAKE_CXX_FLAGS_DEBUG 
	"${CMAKE_CXX_FLAGS_DEBUG} -Wall"
)
# Flags for Release build
set(
	CMAKE_CXX_FLAGS_RELEASE 
	"${CMAKE_CXX_FLAGS_RELEASE} -Wall"
)

# Set C++11
set (CMAKE_CXX_STANDARD 11)

# Setup binary output
add_executable(${BIN_NAME} ${SOURCES})
