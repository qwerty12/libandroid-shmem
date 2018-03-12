PREFIX ?= /usr/local

CFLAGS += -D_DEFAULT_SOURCE -fpic -shared -std=gnu99 -Wall -Wextra -Wl,--version-script=exports.txt

libandroid-shmem.so: shmem.c shm.h
#	 add back -llog if compiling under the NDK
	$(CC) $(CFLAGS) $(LDFLAGS) shmem.c -o $@ 

install: libandroid-shmem.so shm.h
	install -D -m644 libandroid-shmem.so $(PREFIX)/lib/libandroid-shmem.so
	install -D -m644 shm.h $(PREFIX)/include/sys/shm.h
	strip $(PREFIX)/lib/libandroid-shmem.so

clean:
	rm -f libandroid-shmem.so

.PHONY: install
