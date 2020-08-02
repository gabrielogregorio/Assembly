section .data
  ; Variável definida como string
  v1 dw '5', 0xa

section .text
  global _start

_start:
  call converter_valor
  mov ecx, v1
  call mostrar_valor

  jmp _final
  
converter_valor:
  mov eax, [v1]     ; Move o ponteiro de v1 para o eax
  sub eax, '0'      ; Converte eax para inteiro
  add eax, 1        ; adiciona 1 no eax
  add eax, '0'      ; Converte o eax para Caractere
  mov [v1], eax     ; Movemos eax para o ponteiro de v1
  ret


mostrar_valor:
  mov eax, 4        ; Setando para usar a saida
  mov ebx, 1        ; Setando para usar a saida

  mov ecx, v1       ; Mover a mensagem para o ecx
  mov edx, 1        ; Informando o tamanho da mensagem
  int 0x80          ; avisando o Kernel
  ret

_final:
  mov eax, 1        ; Setando para sair do programa
  mov ebx, 0        ; Setando para sair do programa
  int 0x80          ; avisando o Kernel

