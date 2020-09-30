.PHONY: build test clean

build: libtom.so

#-shared是链接选项，告诉gcc生成动态库而不是可执行文件。
#-fPIC是编译选项，PIC是 Position Independent Code 的缩写，表示要生成位置无关的代码，这是动态库需要的特性；
libtom.so: tom.c
	$(COMPILE.c) -fPIC -shared -o $@ tom.c

test: a.out

#通过 -L<path> -lxxx 的gcc选项链接生成的libxxx.so。
a.out: test.c libtom.so
	arm-oe-linux-gnueabi-gcc  -march=armv7-a -mfloat-abi=softfp -mfpu=neon  -O2 -fexpensive-optimizations -frename-registers -fomit-frame-pointer -include quectel-features-config.h -L. -ltom test.c
#把libxxx.so放入链接库的标准路径，或指定 LD_LIBRARY_PATH，才能运行链接了libxxx.so的程序。

clean:
	rm -f *.o *.so a.out