ASSEMBLER = nasm
LINKER = ld
FLAGS = -gdwarf

OBJECTS = main.o utils/files.o parser/parser.o utils/output.o

all: $(OBJECTS)
	$(LINKER) $^ -o main.out

%.o: %.asm
	$(ASSEMBLER) -f elf64 $(FLAGS) $^ -o $@

clean:
	rm -rf main.out $(OBJECTS)
