# CMake file for MSP430 development
# by Shelby Jueden (AkBKukU)

cmake_minimum_required(VERSION 3.1)

# -- Project Configuration --
project(MSP430Test)

# Set name of ouput binary.
set( BIN_NAME msp430test )

# Add all files from a src folder
#file(GLOB SOURCES "src/*.cpp")
file(GLOB SOURCES "${DRIVERLIB_DIR}/*.c" "src/*.c")



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
