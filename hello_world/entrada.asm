; Programa para entrada de dados

SYS_EXIT  equ  1
RET_EXIT  equ  5
SYS_READ  equ  3
SYS_WRITE equ  4
STD_IN    equ  0
STD_OUT   equ  1
MAX_IN    equ  10

segment .date
  msg db "Entre com seu nome: ", 0xA, 0xD
  len equ $- msg

; block start by simbol, declaração de
; iniciaização de informações que serão usadas ainda
segment .bss
  nome resb 2

; Seção principal
segment .text

global _start

_start:
  ; eax == rax => 64 bit
  ; bx -> acumulador de rgistro base
  ; ax -> acumulador para operações numéricas
  ; cx -> registro de contas realizado com operações string
  ; dx -> registro de dados -> e ou r para assembly 64 bit

  ; Exibicao da mensagem
  mov eax, SYS_WRITE
  mov ebx, STD_OUT
  mov ecx, msg
  mov edx, len

  int 0x80
  ; alertar o kernel

  ; Entrada de dados  
  mov eax, SYS_READ
  mov ebx, STD_IN
  mov ecx, nome
  ; maximo 10 caractere
  mov edx, MAX_IN
  int 0x80

exit:
  mov eax, SYS_EXIT
  mov ebx, RET_EXIT ; xor ebx, ebx -> mov ebx para ebx
  int 0x80

       
 
