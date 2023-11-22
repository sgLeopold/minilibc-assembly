bits  64

global strrchr ; Declare the function as global

; Prototypes => char *strchr(const char *s, int c)

; s = rdi
; c = rax

section .text

    strrchr:
        mov rax, 0 ; Initialize rax to 0 (null pointer)
        mov rcx, 0 ; Initialize rcx to 0 (character position)

    loop:
        cmp byte [rdi], 0 ; Check if the current character in s is null
        je loop2 ; If null, jump to loop2
        inc rcx ; Increment character position
        inc rdi ; Move to the next character in s
        jmp loop ; Jump back to the beginning of the loop

    loop2:
        cmp byte [rdi], sil ; Check if the current character in s is equal to c
        je end ; If equal, jump to end
        cmp rcx, 0 ; Check if character position is 0
        je null ; If 0, jump to null
        dec rcx ; Decrement character position
        dec rdi ; Move to the previous character in s
        jmp loop2 ; Jump back to the beginning of loop2

    null:
        mov rax, 0 ; Set rax to 0 (null pointer)
        ret ; Return

    end:
        mov rax, rdi ; Set rax to the address of the found character
        ret ; Return
