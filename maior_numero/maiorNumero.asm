section .data
            ; db - Define Byte - 1 Byte
            ; dw - Define World - 2 Bytes
  x dd 50   ; dd - Define Double World - 4 Bytes
            ; dq - Define Quad World - 4 Bytes
            ; dt - Define Ten World - 10 Bytes

  y dd 10
  msg1 db 'X maior que Y', 0xa
  len1 equ $ - msg1
  msg2 db 'Y maior que X', 0xa
  len2 equ $ - msg2

section .text

global _start

_start:
  mov eax, DWORD [x]
  mov ebx, DWORD [y]
  cmp eax, ebx        ; comparacao, vamos usar os saltos condicionais

  jge maior ; desvio condicional, je =, jg>, jge >=, jl <, jle <=, jne !=

  mov edx, len2
  mov ecx, msg2

  ; Salto incondicional
  jmp final

maior: ; método, label na real...
  mov edx, len1
  mov ecx, msg1

final:
  mov ebx, 1
  mov eax, 4
  int 0x80
  mov eax, 1
  int 0x80
