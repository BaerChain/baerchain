cmake_minimum_required( VERSION 3.5 )

project( BaerChain )

set( BLOCKCHAIN_NAME "BaerChain" )
set( CMAKE_CXX_STANDARD 14 )
set( CMAKE_CXX_EXTENSIONS ON )
set( CXX_STANDARD_REQUIRED ON)

add_subdirectory( libraries )
add_subdirectory( plugins )
add_subdirectory( programs )

