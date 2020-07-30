; Hello World

SYS_EXIT  equ  1
RET_EXIT  equ  5
SYS_WRITE equ  4
STD_OUT   equ  1

segment .date
  msg db "Ola mundo ", 0xA, 0xD
  tamanho equ $- msg

segment .text

global _start

_start:
  ; bx -> acumulador de rgistro base
  ; ax -> acumulador para operações numéricas
  ; cx -> registro de contas realizado com operações string
  ; dx -> registro de dados -> e ou r para assembly 64 bit

  ; Exibicao da mensagem
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msg
  mov edx, tamanho

  int 0x80

exit:
  mov eax, SYS_EXIT
  mov ebx, RET_EXIT ; xor ebx, ebx -> mov ebx para ebx
  int 0x80

       
 
