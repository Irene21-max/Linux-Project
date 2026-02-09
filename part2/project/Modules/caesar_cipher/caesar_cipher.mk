

.PHONY: caesar_cipher

caesar_cipher:  $(APP_OBJ_DIR)/caesar_decrypt.o $(APP_OBJ_DIR)/caesar_encrypt.o | $(APP_LIB_DIR)
	$(AR) -cr $(APP_LIB_DIR)/libcaesar_op.a $(APP_OBJ_DIR)/caesar_decrypt.o $(APP_OBJ_DIR)/caesar_encrypt.o 

$(APP_OBJ_DIR)/caesar_encrypt.o: $(CAESAR_CIPHER_SRC)/caesar_encrypt.c | $(APP_OBJ_DIR)
	$(CC) -c $(CAESAR_CIPHER_SRC)/caesar_encrypt.c -o $(APP_OBJ_DIR)/caesar_encrypt.o $(CFLAGS)

$(APP_OBJ_DIR)/caesar_decrypt.o: $(CAESAR_CIPHER_SRC)/caesar_decrypt.c | $(APP_OBJ_DIR)
	$(CC) -c $(CAESAR_CIPHER_SRC)/caesar_decrypt.c -o $(APP_OBJ_DIR)/caesar_decrypt.o $(CFLAGS)
