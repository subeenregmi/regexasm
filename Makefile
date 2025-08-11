all: main.o utils/files.o parser/parser.o utils/output.o
	ld main.o utils/files.o parser/parser.o utils/output.o -o main.out 

main.o: main.asm 
	nasm -f elf64 main.asm -o main.o -gdwarf

utils/files.o: utils/files.asm
	nasm -f elf64 utils/files.asm -o utils/files.o -gdwarf

parser/parser.o: parser/parser.asm
	nasm -f elf64 parser/parser.asm -o parser/parser.o -gdwarf

utils/output.o: utils/output.asm
	nasm -f elf64 utils/output.asm -o utils/output.o -gdwarf

clean:
	rm -rf *.o *.out utils/*.o constants/*.o parser/*.o
