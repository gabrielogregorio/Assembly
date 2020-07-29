section .data
  ; Definimos variávis no formato string
  v1 dw '5', 0xa    ; Variável Caractere, double world

section .text
  global _start

_start:
  call converter_valor
  mov ecx, v1
  call mostrar_valor

_final:
  ; Finalizar
  mov eax, 1
  mov ebx, 0
  int 0x80

converter_valor:
  mov eax, [v1]     ; Movemos o v1 para a posicao eax
  sub eax, '0'      ; Converte eax para inteiro.
  add eax, 1        ; ADD, Adiciona o elemento a variável, PRIMEIRO ELEMENTO
  add eax, '0'      ; Converte para Caractere
  mov [v1], eax     ; Movemos eax para o ponteiro de v1

  ret

mostrar_valor:
  ; Exibir
  mov ecx, v1       ; Mov para exc o valor de v1
  mov eax, 4        ; Vamos setar o valor 4 de saida
  mov ebx, 1
  mov edx, 1        ; Tamanho da string, 1 nesse caso
  int 0x80          ; Chamamos a 0x80

  ; Retorna ao ponto que foi chamado
  ret
