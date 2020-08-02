#!/usr/bin/bash
echo "..NASM"
nasm -f elf64 chatbot.asm

echo "..LD"
ld -s -o chatbot chatbot.o

