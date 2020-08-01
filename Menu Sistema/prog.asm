section .data
   ; cada 10 é um salto de linha
   ; 0 é finalizando a string
   tit        db  10, '*-------------*', 10, '| Calculadora |', 10, '| Calculadora |', 0
   ltit       equ $-tit       ; Tamanho

   obValor    db  10, 'Valor 1:', 0
   lobValor   equ $-obValor    ; Tamanho

   obValor2   db  10, 'Valor 2:', 0
   lobValor2  equ $-obValor2   ; Tamanho

   opc1       db  10, '1. Adicionar', 0
   lopc1      equ $-opc1   ; Tamanho
   
   opc2       db  10, '2. Subtrair', 0
   lopc2      equ $-opc2   ; Tamanho

   opc3       db  10, '3. Multiplicar', 0
   lopc3      equ $-opc3   ; Tamanho

   opc4       db  10, '4. Dividir', 0
   lopc4      equ $-opc4   ; Tamanho

   msgOpc     db  10, 'Escolha uma operacao:', 0
   lmsgOpc    equ $-msgOpc

   msgErr     db  10, 'Opcao invalida', 0
   lmsgErr    equ $-msgErr

   nLinha     db  10,0
   lnLinha    db $-nLinha
   
section .bss
    ; Variáveis que podem mudar de valor
    opc    resb 2
    num1   resb 10
    num2   resb 10
    result resb 10

section .text
    global _start

_start:
    mov ecx, tit
    mov edx, ltit
    call mst_saida

    mov ecx, obValor
    mov edx, lobValor
    call mst_saida
    mov ecx, num1
    mov edx, 10
    mov eax, 3
    mov ebx, 0
    int 80h

    mov ecx, obValor2
    mov edx, lobValor2
    call mst_saida
    mov ecx, num2
    mov edx, 10
    mov eax, 3
    mov ebx, 0
    int 80h

    ; opções
    mov ecx, opc1
    mov edx, lopc1
    call mst_saida

    mov ecx, opc2
    mov edx, lopc2
    call mst_saida

    mov ecx, opc3
    mov edx, lopc3
    call mst_saida

    mov ecx, opc4
    mov edx, lopc4
    call mst_saida

    ; obter a operacao
    mov ecx, msgOpc
    mov edx, lmsgOpc
    call mst_saida
    mov ecx, opc
    mov edx, 2
    mov eax, 3
    mov ebx, 0
    int 80h

    ; Converter a saida para decimal
    mov ah, [opc]
    sub ah, '0' ; Removendo o zero da string

    ; Comparação
    cmp ah, 1
    je adicionar
    
    cmp ah, 2
    je subtrair

    cmp ah, 3
    je multiplicar

    cmp ah, 4
    je dividir

    mov ecx, msgErr
    mov edx, lmsgErr
    call mst_saida
    jmp exit

adicionar:
    ;add eax, ebx
    jmp exit

subtrair:
    jmp exit

multiplicar:
    ; AX e BX
    ; mul bx
    jmp exit

dividir:
    ; AX e BX
    ; div bx
    jmp exit

mst_saida:
    mov eax, 4
    mov ebx, 1

    int 80h
    ret


exit:
    ;equivalente ao "\n"
    mov ecx, nLinha,
    mov edx, lnLinha
    call mst_saida

    mov eax, 1
    mov ebx, 0
    int 80h


