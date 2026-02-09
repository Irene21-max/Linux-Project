cmake_minimum_required(VERSION 3.10)
project(CipherProject)

# Set the C standard
set(CMAKE_C_STANDARD 99)

# Add subdirectories for modules and application
add_subdirectory(Modules/caesar_cipher)
add_subdirectory(Modules/xor_cipher)
add_subdirectory(Application)

# Set the output directory for the executable
set(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/out)
