LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE    := libssl
LOCAL_SRC_FILES := ssl/$(TARGET_ARCH_ABI)/libssl.so
include $(PREBUILT_SHARED_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE    := libcrypto
LOCAL_SRC_FILES := ssl/$(TARGET_ARCH_ABI)/libcrypto.so
include $(PREBUILT_SHARED_LIBRARY)


#include $(CLEAR_VARS)

#SQLCIPHER_SRC_PATH := src

#LOCAL_MODULE := sqlcipher
#LOCAL_SRC_FILES := $(SQLCIPHER_SRC_PATH)/sqlite3.c

# 添加其他需要的源文件，如 SQLCipher 特定的扩展等

#LOCAL_C_INCLUDES := $(SQLCIPHER_SRC_PATH)/

#LOCAL_CFLAGS := -DSQLITE_HAS_CODEC -DSQLCIPHER_CRYPTO_OPENSSL

#LOCAL_SHARED_LIBRARIES := libssl

#include $(BUILD_SHARED_LIBRARY)


#LOCAL_PATH := $(call my-dir)

android_sqlite_cflags :=  -DHAVE_USLEEP=1 \
	-DSQLITE_DEFAULT_JOURNAL_SIZE_LIMIT=1048576 -DSQLITE_THREADSAFE=1 -DNDEBUG=1 \
	-DSQLITE_ENABLE_MEMORY_MANAGEMENT=1 -DSQLITE_TEMP_STORE=3 \
	-DSQLITE_ENABLE_FTS3_BACKWARDS -DSQLITE_ENABLE_LOAD_EXTENSION \
	-DSQLITE_ENABLE_MEMORY_MANAGEMENT -DSQLITE_ENABLE_COLUMN_METADATA \
	-DSQLITE_ENABLE_FTS4 -DSQLITE_ENABLE_UNLOCK_NOTIFY -DSQLITE_ENABLE_RTREE \
	-DSQLITE_SOUNDEX -DSQLITE_ENABLE_STAT3 -DSQLITE_ENABLE_FTS4_UNICODE61 \
	-DSQLITE_THREADSAFE

sqlcipher_cflags := -DSQLITE_HAS_CODEC -DHAVE_FDATASYNC=0 -Dfdatasync=fsync

#sqlcipher/sqlite3.c:
#	cd $(LOCAL_PATH)/sqlcipher && ./configure
#	make -C sqlcipher sqlite3.c

sqlcipher_files := \
	src/sqlite3.c

include $(CLEAR_VARS)
LOCAL_MODULE := static-libcrypto
LOCAL_EXPORT_C_INCLUDES := ssl/include/openssl/include
#LOCAL_SRC_FILES := openssl/libcrypto.a
LOCAL_SRC_FILES := ssl/$(TARGET_ARCH_ABI)/libcrypto.a
include $(PREBUILT_STATIC_LIBRARY)


include $(CLEAR_VARS)
LOCAL_MODULE            := sqlite3
LOCAL_LDLIBS += -llog
LOCAL_SRC_FILES         := $(sqlcipher_files)
LOCAL_C_INCLUDES        := src #sqlcipher
LOCAL_CFLAGS            := $(android_sqlite_cflags) $(sqlcipher_cflags)
LOCAL_STATIC_LIBRARIES 	:= static-libcrypto
include $(BUILD_SHARED_LIBRARY)
