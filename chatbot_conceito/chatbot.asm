; Isso ainda é mato
 
SYS_WRITE    equ   4
STD_OUT      equ   1
SYS_READ     equ   3
STD_IN       equ   0
MAX_IN       equ   50
SYS_EXIT     equ   1
RET_EXIT     equ   5

segment .data
    msg db "Faça uma pergunta: ", 0
    lmsg equ $-msg

    msg_tchau db "tchau", 10, 0
    lmsg_tchau equ $-msg_tchau

    msg_finalizando db "Chatbot finalizado", 10, 0
    lmsg_finalizando equ $-msg_finalizando

    msg_nome db "qual e o seu nome?", 10, 0
    lmsg_nome equ $-msg_nome

    msg_nome_res db "Meu nome é ASA", 10, 0
    lmsg_nome_res equ $-msg_nome_res

    msg_sair db 'sair',10, 0
    lmsg_sair equ $-msg_sair

    limpar db '', 0
    llimpar equ $-limpar


segment .bss
    resposta resb 1

section .text
    global _start

_start:

    mov ecx, msg         ; Mensagem
    mov edx, lmsg        ; Tamanho da mensagem
    call mst_msg         ; Mostrando a mensagem

    mov eax, SYS_READ    ; Setando a entrada
    mov ebx, STD_IN      ; Setando a entrada
    mov ecx, resposta    ; Movendo a resposta para o ecx
    mov edx, MAX_IN      ; Informando o tamanho máximo da entrada
    int 0x80             ; Avisando o Kernel




    ; NOME
    lea esi, [msg_nome]
    lea edi, [resposta]
    mov ecx, lmsg_nome
    rep cmpsb         
    mov eax, 4        
    mov ebx, 1  
    je _nome

    
    ; SAIR
    lea esi, [msg_sair]
    lea edi, [resposta]
    mov ecx, lmsg_sair
    rep cmpsb         
    mov eax, 4        
    mov ebx, 1  
    je _sair

    jmp _start
_nome:
   mov ecx, msg_nome_res
   mov edx, lmsg_nome_res
   call mst_msg

   jmp _start
_sair:
   mov ecx, msg_finalizando
   mov edx, lmsg_finalizando
   call mst_msg

   jmp _final
mst_msg:
    mov eax, SYS_WRITE   ; Setando a saida
    mov ebx, STD_OUT     ; Setando a saida
    int 80h              ; Avisando o Kernel
    ret                  ; Retornando

_final:
   mov eax, SYS_EXIT     ; Setando a finalização
   mov ebx, RET_EXIT     ; Setando a finalização
   int 80h               ; Avisando o Kernel