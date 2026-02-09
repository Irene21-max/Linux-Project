cmake_minimum_required(VERSION 3.10)
project(CaesarCipher)

# Include directories
include_directories(inc)

# Source files
set(CAESAR_CIPHER_SRC src/caesar_encrypt.c src/caesar_decrypt.c)

# Create a static library
add_library(caesar_cipher STATIC ${CAESAR_CIPHER_SRC})

# Set the output directory for the library
set_target_properties(caesar_cipher PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/out/libs
)
