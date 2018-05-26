# Set CMAKE to cross compiling
set(CMAKE_SYSTEM_NAME Generic)


# -- Envoironment Configuration --

# Add TI dependencies assuming directories in opt
set( GCC_DIR "/opt/msp430/msp430-gcc" )
set( GCC_SUPPORT_DIR "/opt/msp430/msp430-gcc-support-files" )
set( DRIVERLIB "/opt/msp430/msp430-driverlib" )

# Executables
set( GCC_BIN_DIR "${GCC_DIR}/bin" )
set(CMAKE_C_COMPILER "${GCC_BIN_DIR}/msp430-elf-gcc" )
set(CMAKE_CXX_COMPILER "${GCC_BIN_DIR}/msp430-elf-g++" )
set(CMAKE_CXX_LINK_EXECUTABLE "${GCC_BIN_DIR}/msp430-elf-ld" )
set(CMAKE_C_LINK_EXECUTABLE "${GCC_BIN_DIR}/msp430-elf-ld" )

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

