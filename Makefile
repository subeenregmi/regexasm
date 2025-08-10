all: main.o utils/files.o
	ld main.o utils/files.o -o main.out

main.o: main.asm 
	nasm -f elf64 main.asm -o main.o -gdwarf

utils/files.o: utils/files.asm
	nasm -f elf64 utils/files.asm -o utils/files.o -gdwarf

clean:
	rm -rf *.o *.out
