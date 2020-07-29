section .text

global _start


_start:
  mov eax, 1   ; método exit
  mov ebx, 98  ; valor de retorno
  int 0x80     ; envio para o Kernel
