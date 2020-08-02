### União de C++ com Assembly
nasm -f elf64 troca.asm  -o troca.o
g++ troca.o troca.cpp -o runme

ou digite make
