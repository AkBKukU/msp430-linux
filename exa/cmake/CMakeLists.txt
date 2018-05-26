# CMake file for MSP430 development
# by Shelby Jueden (AkBKukU)
INCLUDE(CMakeForceCompiler)

cmake_minimum_required(VERSION 3.1)

# Set CMAKE to cross compiling
set(CMAKE_SYSTEM_NAME Generic)

# Device name for the chip to compile
set( DEVICE MSP430FR5969 )
string( TOLOWER ${DEVICE} DEVICE )
set( LINKER_SCRIPT "${DEVICE}.ld" )


# -- Envoironment Configuration --

# Add TI dependencies assuming directories in opt
set( GCC_DIR "/opt/msp430/msp430-gcc" )
set( GCC_SUPPORT_DIR "/opt/msp430/msp430-gcc-support-files" )
set( DRIVERLIB "/opt/msp430/msp430-driverlib/driverlib/MSP430FR5xx_6xx" )

# Executables
set( GCC_BIN_DIR "${GCC_DIR}/bin" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -T ${LINKER_SCRIPT}" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -mmcu=${DEVICE}" )
set( CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -g -Wl,--gc-sections" )

set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -O2 -D__$(DEVICE)__ -mmcu=${DEVICE} -g -ffunction-sections" )
set( CMAKE_CXX_FLAGS  "${CMAKE_CXX_FLAGS} -fdata-sections -DDEPRECATED" )

CMAKE_FORCE_C_COMPILER("${GCC_BIN_DIR}/msp430-elf-gcc" GNU)
CMAKE_FORCE_CXX_COMPILER( "${GCC_BIN_DIR}/msp430-elf-g++" GNU)
#set(CMAKE_CXX_LINK_EXECUTABLE "${GCC_BIN_DIR}/msp430-elf-ld" )
#set(CMAKE_C_LINK_EXECUTABLE "${GCC_BIN_DIR}/msp430-elf-ld" )

# search for programs in the build host directories
SET(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
# for libraries and headers in the target directories
SET(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
SET(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)


# include directories
# TODO - add optional driverlib support
# TODO - add optional energia support
include_directories( "${GCC_DIR}/msp430-elf/include" )
include_directories( "${GCC_SUPPORT_DIR}/include" )
include_directories( "${DRIVERLIB}" )

# -- Project Configuration --
project(MSP430Test)

# Set name of ouput binary.
set( BIN_NAME msp430test )

# Add all files from a src folder
#file(GLOB SOURCES "src/*.cpp")
file(GLOB SOURCES "${DRIVERLIB}/*.c" "src/*.c")



# -- Compiling Configuration --
# TODO - Seperate toolchain file for this


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
#set (CMAKE_CXX_STANDARD 11)

message("Bin Name: ${BIN_NAME}")
message("Sources: ${SOURCES}")

message("Compiler: ${CMAKE_C_COMPILER}")
# Setup binary output
add_executable(${BIN_NAME} ${SOURCES})
#set_target_properties( ${BIN_NAME} PROPERTIES LINK_DEPENDS ${LINKER_SCRIPT} )
