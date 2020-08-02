
SYS_READ     equ   3
STD_IN       equ   0
SYS_WRITE    equ   4
STD_OUT      equ   1

section .data
   ; Setando os valores
   ; e obtedo o tamanho deles
   tit        db  10, '*-------------*', 10, '| Calculadora |', 10, '* ----------- *', 0
   ltit       equ $-tit

   obValor    db  10, 'Digite o valor 1:', 0
   lobValor   equ $-obValor

   obValor2   db  10, 'Digite o valor 2:', 0
   lobValor2  equ $-obValor2

   opc1       db  10, '1. Adicionar', 0
   lopc1      equ $-opc1

   opc2       db  10, '2. Subtrair', 0
   lopc2      equ $-opc2

   opc3       db  10, '3. Multiplicar', 0
   lopc3      equ $-opc3

   opc4       db  10, '4. Dividir', 0
   lopc4      equ $-opc4

   msgOpc     db  10, 'Escolha uma operacao:', 0
   lmsgOpc    equ $-msgOpc

   msgErr     db  10, 'Opcao invalida', 0
   lmsgErr    equ $-msgErr

   nLinha     db  10, 0
   lnLinha    db $-nLinha   

; Variáveis que podem alterar o valor
section .bss
    opc    resb 2
    num1   resb 10
    num2   resb 10
    result resb 10

section .text
    global _start

_start:
  ; bx -> acumulador de rgistro base
  ; ax -> acumulador para operações numéricas
  ; cx -> registro de contas realizado com operações string
  ; dx -> registro de dados -> e ou r para assembly 64 bit

    mov ecx, tit         ; Mensagem
    mov edx, ltit        ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    ; ***** OBTENDO O VALOR 1 *********
    mov ecx, obValor     ; Mensagem
    mov edx, lobValor    ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, num1        ; Movendo o número 1 para o ecx
    mov edx, 10          ; Informando o tamanho máximo da entrada
    mov eax, SYS_READ    ; Setando para entrada de dados
    mov ebx, STD_IN      ; Setando para entrada de dados
    int 80h              ; Alertando o Kernel

    ; ***** OBTENDO O VALOR 2 *********
    mov ecx, obValor2    ; Mensagem
    mov edx, lobValor2   ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, num2        ; Movendo o número 2 para o ecx
    mov edx, 10          ; Informando o tamanho máximo da entrada
    mov eax, SYS_READ    ; Setando para entrada de dados
    mov ebx, STD_IN      ; Setando para entrada de dados
    int 80h              ; Alertando o Kernel

    ; ******* ESCOLHA DA OPERACAO ********* 
    mov ecx, opc1        ; Mensagem
    mov edx, lopc1       ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, opc2        ; Mensagem
    mov edx, lopc2       ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, opc3        ; Mensagem
    mov edx, lopc3       ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, opc4        ; Mensagem
    mov edx, lopc4       ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, msgOpc      ; Mensagem
    mov edx, lmsgOpc     ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    mov ecx, opc         ; Movendo a opção para o ecx
    mov edx, 1           ; Movendo o tamanho máximo da entrada

    mov eax, SYS_READ    ; Setando para entrada de dados
    mov ebx, STD_IN      ; Setando para entrada de dados
    int 80h              ; Alertando o Kernel

    mov ah, [opc]        ; Movendo o ponteiro de opc para AH
    sub ah, '0'          ; Removendo o zero da string

    ; ****** COMPARANDO A ESCOLHA *****
    cmp ah, 1            ; comparação
    je adicionar         ; se for igual
    
    cmp ah, 2            ; comparação
    je subtrair          ; se for igual

    cmp ah, 3            ; comparação
    je multiplicar       ; se for igual
 
    cmp ah, 4            ; comparação
    je dividir           ; se for igual

    mov ecx, msgErr      ; Mensagem
    mov edx, lmsgErr     ; Tamanho da mensagem
    call mst_saida       ; Exibindo na tela

    jmp exit             ; Fim do programa

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
    mov eax, SYS_WRITE  ; Setando a saida
    mov ebx, STD_OUT    ; Setando a saida
    int 80h             ; Alertando o Kernel
    ret                 ; Retornando

exit:
    mov ecx, nLinha     ; Mensagem
    mov edx, lnLinha    ; Tamanho da mensagem
    call mst_saida      ; Exibindo na tela

    mov eax, 1          ; Setando para finalizar o programa
    mov ebx, 0          ; Setando para finalizar o programa
    int 80h             ; Alertando o Kernel
