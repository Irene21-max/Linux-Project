
.PHONY: xor_cipher

xor_cipher: $(APP_OBJ_DIR)/xor_decrypt.o $(APP_OBJ_DIR)/xor_encrypt.o | $(APP_LIB_DIR)
	$(CC) $(APP_OBJ_DIR)/xor_decrypt.o $(APP_OBJ_DIR)/xor_encrypt.o -o $(APP_LIB_DIR)/libxor_op.so -shared
	
$(APP_OBJ_DIR)/xor_encrypt.o: $(XOR_CIPHER_SRC)/xor_encrypt.c | $(APP_OBJ_DIR)
	$(CC) -c $(XOR_CIPHER_SRC)/xor_encrypt.c -o $(APP_OBJ_DIR)/xor_encrypt.o $(CFLAGS)
	
$(APP_OBJ_DIR)/xor_decrypt.o: $(XOR_CIPHER_SRC)/xor_decrypt.c | $(APP_OBJ_DIR)
	$(CC) -c $(XOR_CIPHER_SRC)/xor_decrypt.c -o $(APP_OBJ_DIR)/xor_decrypt.o $(CFLAGS)
