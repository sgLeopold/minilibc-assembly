bits  64

global strlen ; Declare the function as global

; Prototype => size_t strlen(const char *str)

; str = rdi

section .text

    strlen:
        mov rax, 0 ; Initialize length counter to zero

    loop:
        cmp byte [rdi + rax], 0 ; Compare current character with null terminator
        je end ; If null terminator is found, jump to end
        inc rax ; Increment length counter
        jmp loop ; Jump back to the beginning of the loop

    end:
        ret ; Return the calculated string length in rax
