all: clean build run

clean: 
	rm -rf bin
build:
	mkdir bin
	nasm src/boot.asm -f bin -o bin/boot.bin
run:
	qemu-system-x86_64 bin/boot.bin