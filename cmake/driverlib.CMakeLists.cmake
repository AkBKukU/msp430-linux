# CMake library for DriverLib for msp430 
# by Shelby Jueden (AkBKukU)
project(DriverLib VERSION 1.0 DESCRIPTION "DriverLib for msp430's")

# Prepended string for messages to indicate failure area
set( PRE "[Lib:DriverLib]" )

# DEVICE must be set so the correct source directory can be loaded
if( DEFINED DEVICE )
	message( STATUS "${PRE} Using device \"${DEVICE}\"" )
else()
	message( FATAL_ERROR "${PRE} No device \"${DEVICE}\" set, cannot choose directory" )
endif()

# Get sources for speific device
if (${DEVICE} MATCHES "^msp430f5" OR ${DEVICE} MATCHES "^msp430f6")
	set( DRVLIB_DEV_DIR "driverlib/MSP430F5xx_6xx")
elseif (${DEVICE} MATCHES "^msp430fr2" OR ${DEVICE} MATCHES "^msp430fr4")
	set( DRVLIB_DEV_DIR "driverlib/MSP430FR2xx_4xx")
elseif (${DEVICE} MATCHES "^msp430fr57")
	set( DRVLIB_DEV_DIR "driverlib/MSP430FR57xx")
elseif (${DEVICE} MATCHES "^msp430fr5" OR ${DEVICE} MATCHES "^msp430fr6")
	set( DRVLIB_DEV_DIR "driverlib/MSP430FR5xx_6xx")
elseif (${DEVICE} MATCHES "^msp430i2")
	set( DRVLIB_DEV_DIR "driverlib/MSP430i2xx")
else()
	message( FATAL_ERROR "${PRE} No folder for device \"${DEVICE}\"" )
endif()

message( STATUS "${PRE} \"${DEVICE}\" files loading from ${CMAKE_CURRENT_SOURCE_DIR}/${DRVLIB_DEV_DIR}" )
file( GLOB DRVLIB_SRCS "${DRVLIB_DEV_DIR}/*.c")

add_library( DriverLib ${DRVLIB_SRCS} )
target_include_directories ( DriverLib PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/${DRVLIB_DEV_DIR})

