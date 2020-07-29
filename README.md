sudo apt-get install nasm

> Transformando o programa em linguagem de máquina
nasm -f elf64 hello.asm

> Gerar o executável 
ld -s -o hello hello.o


