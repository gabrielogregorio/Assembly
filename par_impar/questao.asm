; jump -> Salvo incondicional
;
; ************ Salto Condicional ************
;
; cmp a,   b
; je  a == b
; jne a != b
; jg  a >  b
; jge a >= b
; jl  a <  b
; jle a <= b
;
; Conceito de número par
; Um numero subtraido sucessivamete até o zero
; se der menor, é impar

global Question

segment .text

; edi recebe o valor do C
; eax saida para o C
; ebx recebe o valor de edi
Question:
    mov ebx, edi
    jmp _testar
    ret

_testar:
    cmp ebx, 0
    je _par
    jl _impar

    sub ebx, 2
    jmp _testar

_par:
   mov eax, 0
   ret
_impar:
   mov eax, 1
   ret
