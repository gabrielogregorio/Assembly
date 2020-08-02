; Programa para entrada de dados

SYS_EXIT  equ  1
RET_EXIT  equ  5
SYS_READ  equ  3
SYS_WRITE equ  4
STD_IN    equ  0
STD_OUT   equ  1
MAX_IN    equ  10

segment .date
  msg db "Entre com seu nome: ", 10, 0
  len equ $-msg
segment .bss
  nome resb 2

segment .text
  global _start

_start:
  mov eax, SYS_WRITE    ; Setando a saída
  mov ebx, STD_OUT      ; Setando a saída
  mov ecx, msg          ; Movendo a mensagem para o ecx
  mov edx, len          ; informando o tamanho da mensage
  int 0x80              ; Alertando o Kernel

  ; **** Entrada de dados ********
  mov eax, SYS_READ     ; Setando para entrada de dados
  mov ebx, STD_IN       ; Setando para entrada de dados
  mov ecx, nome         ; Movendo a variável nome para o ecx
  mov edx, MAX_IN       ; Informando o tamanho máximo da entrada
  int 0x80              ; Alertando o Kernel

exit:
  mov eax, SYS_EXIT ; Setando a saída
  mov ebx, RET_EXIT ; Setando a saída || xor ebx, ebx -> mov ebx para ebx
  int 0x80          ; Alertando o Kernel
