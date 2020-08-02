; Hello World

SYS_EXIT  equ  1
RET_EXIT  equ  5
SYS_WRITE equ  4
STD_OUT   equ  1

segment .date
  msg db "Ola mundo ", 10, 0  ; Mensagem com um \n, 0 finaliza
  tamanho equ $-msg           ; Obtendo o tamanho da mensagem

segment .text

global _start

_start:
  ; bx -> acumulador de rgistro base
  ; ax -> acumulador para operações numéricas
  ; cx -> registro de contas realizado com operações string
  ; dx -> registro de dados -> e ou r para assembly 64 bit

  ; Exibicao da mensagem
  mov eax, SYS_WRITE ; Preparando para a saída
  mov ebx, STD_OUT   ; Preparando para a saída
  mov ecx, msg       ; Movendo a mensagem
  mov edx, tamanho   ; Movendo o tamanho da mensagem

  int 0x80            ; Alertando o Kernel

exit:
  mov eax, SYS_EXIT   ; Setando a saída
  mov ebx, RET_EXIT   ; Setando a saída || xor ebx, ebx -> mov ebx para ebx
  int 0x80            ; Alertando o Kernel
