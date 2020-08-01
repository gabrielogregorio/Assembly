section .data
  ; Definimos variávis no formato string
  v1 dw '129', 0xa    ; Variável Caractere, double world

; Variáveis que você quer
section .bss
   ; maximo 10 elementos para calcular
   buffer: resb 10


section .text
  global _start

_start:
  call converter_valor
  call mostrar_valor

final:
  ; Finalizar
  mov eax, 1
  mov ebx, 0
  int 0x80

converter_valor:
  lea esi, [v1]
  mov ecx, 3
  call string_to_int
  add eax, 1        ; ADD, Adiciona o elemento a variável, PRIMEIRO ELEMENTO
  ret

mostrar_valor:
  lea esi, [buffer]
  call int_to_string
  mov eax, 4        ; Vamos setar o valor 4 de saida
  mov ebx, 1
  mov ecx, buffer
  mov edx, 10        ; Tamanho do buffer
  int 0x80          ; Chamamos a 0x80
  ret

; Converte string para inteiro
; entrad: ESI - ponteiro da string para converter
; EXC - numero de digitos que a string tem
; saida, eax com o valor
string_to_int:
  xor ebx, ebx;

.prox_digito:
    movzx eax, byte[esi]
    inc esi
    sub al, '0'
    imul ebx, 10
    add ebx, eax ; ebx = ebx * 10 + eax
    loop .prox_digito ; while -- exc, diminuir um na posicao de ecx
    mov eax, ebx
    ret

; Converter inteiro para string
; Entrada EAX, ESI
; Saída: EAX
int_to_string:
    add esi, 9
    mov byte[esi], 0
    mov ebx, 10

.prox_digito:
    ; limpar o edx
    xor edx, edx
    div ebx
    add dl, '0'
    dec esi
    mov [esi], dl
    test eax, eax
    jnz .prox_digito ; até eax == 0
    mov eax, esi

    ret
