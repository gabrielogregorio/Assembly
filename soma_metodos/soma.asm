section .data
  v1 dw '5', 0xa    ; Variável Caractere, double world

section .text
  global _start

_start:

  mov eax, [v1]     ; Movemos o v1 para a posicao eax
  sub eax, '0'      ; Converte eax para inteiro.
  add eax, 1        ; A, Adiciona o elemento a variável
  add eax, '0'      ; Converte para Caractere
  mov [v1], eax     ; Movemos para o ponteiro de v1
  
  ; Exibir
  mov ecx, v1       ; Mov para xc o valor de v1
  mov eax, 4        ; Vamos setar o valor 4 de saida
  mov ebx, 1
  mov edx, 1        ; Tamanho da string
  int 0x80          ; Chamamos a 0x80

  ; Finalizar
  mov eax, 1
  mov ebx, 0
  int 0x80
