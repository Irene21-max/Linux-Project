# Main Directories
ROOT_DIR = ./..
APP_DIR = .
MODULES_DIR = ./../Modules

# Modules Directories
CAESAR_CIPHER_DIR = $(MODULES_DIR)/caesar_cipher
XOR_CIPHER_DIR = $(MODULES_DIR)/xor_cipher

# Application Directories
APP_OUT_DIR = ./out
APP_OBJ_DIR = $(APP_OUT_DIR)/gen
APP_LIB_DIR = $(APP_OUT_DIR)/libs
#APP_BIN = 

# Modules Source files
CAESAR_CIPHER_SRC = $(CAESAR_CIPHER_DIR)/src
XOR_CIPHER_SRC = $(XOR_CIPHER_DIR)/src
CAESAR_CIPHER_INC = $(CAESAR_CIPHER_DIR)/inc
XOR_CIPHER_INC = $(XOR_CIPHER_DIR)/inc
CFLAGS = -I$(CAESAR_CIPHER_INC) -fPIC -I$(XOR_CIPHER_INC)
LFLAGS = -Wl,-rpath,$(APP_LIB_DIR)

# Modules Object files
CAESAR_CIPHER_OBJ = ./gen
XOR_CIPHER_OBJ = ./gen

# Modules Library files
CAESAR_CIPHER_LIB = ./libs
XOR_CIPHER_LIB = ./libs

# Application Source files
APP_SRC = .

# Application Object files
APP_OBJ = ./gen

AR = ar

include $(CAESAR_CIPHER_DIR)/caesar_cipher.mk
include $(XOR_CIPHER_DIR)/xor_cipher.mk

.PHONY: all clean

all: $(APP_OBJ_DIR)/app.o caesar_cipher xor_cipher
	$(CC) $(APP_OBJ_DIR)/app.o -L$(APP_LIB_DIR)/libcaesar_op.a $(APP_LIB_DIR)/libxor_op.so $(CFLAGS) $(LFLAGS) -o $(APP_OUT_DIR)/output 

$(APP_OBJ_DIR)/app.o: app.c | $(APP_OBJ_DIR)
	$(CC) -c ./app.c -o $(APP_OBJ_DIR)/app.o $(CFLAGS)
	
$(APP_OBJ_DIR):
	mkdir -p $(APP_OBJ_DIR)
	
$(APP_LIB_DIR):
	mkdir -p $(APP_LIB_DIR)
	
clean:
	rm -rf $(APP_OUT_DIR)

