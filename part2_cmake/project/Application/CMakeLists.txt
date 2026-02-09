cmake_minimum_required(VERSION 3.10)
project(CipherApp)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/Modules/caesar_cipher/inc)
include_directories(${CMAKE_SOURCE_DIR}/Modules/xor_cipher/inc)

# Source files
set(APP_SRC app.c)

# Create the executable
add_executable(output ${APP_SRC})

# Link the libraries
target_link_libraries(output caesar_cipher xor_cipher)

# Set the output directory for the executable
set_target_properties(output PROPERTIES
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out
)
