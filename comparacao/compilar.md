
# 32 BIT
bit: nasm -f elf32 compara.asm
ld -m elf_i386 -o compara32 compara.o 

# 64 BIT
nasm -f elf64 compara.asm
ld -s -o compara64 compara.o
