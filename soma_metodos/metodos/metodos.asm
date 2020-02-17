section .data
  v1 dw '20', 0xa       ; Variável Caractere, double world

section .text
  global _start

_start:
  call converter_valor  ; Chamar função
  mov ecx, v1
  call mostrar_valor    ; Chama o método mostrar valor

_final:                 ; Label, finalizar
  mov eax, 1
  mov ebx, 0
  int 0x80

converter_valor:        ; Métodos são criados a partir do 'final'
  mov eax, [v1]
  sub eax, '0'          ; ALERTA ALERTA ALERTA
  add eax, 1            ; Add só pega o primeiro valor
  add eax, '0'
  mov [v1], eax
  ret                   ; Retorna para o ponto que chamou

mostrar_valor:
  mov eax, 4
  mov ebx, 1
  mov edx, 2            ; quantidade de elementos do valor para retornar
  int 0x80
  ret
