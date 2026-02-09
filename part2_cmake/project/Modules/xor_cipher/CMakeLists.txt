cmake_minimum_required(VERSION 3.10)
project(XORCipher)

# Include directories
include_directories(inc)

# Source files
set(XOR_CIPHER_SRC src/xor_encrypt.c src/xor_decrypt.c)

# Create a shared library
add_library(xor_cipher SHARED ${XOR_CIPHER_SRC})

# Set the output directory for the library
set_target_properties(xor_cipher PROPERTIES
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/libs
)
