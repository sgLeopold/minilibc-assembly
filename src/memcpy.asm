bits  64

; Prototype => void *memcpy(void *dest, const void *src, size_t n)

global memcpy ; Declare the function as global

section .text

    memcpy:
        push rbp ; Save the base pointer
        mov rbp, rsp ; Set up the base pointer
        mov r8, 0 ; Initialize a counter (r8) to zero
        mov rax, rdi ; Copy the destination address to rax

    loop:
        cmp rdx, 0 ; Compare the count (n) with zero
        je end ; If count is zero, jump to end
        mov cl, byte [rsi + r8] ; Load a byte from the source (src) into cl
        mov byte [rdi + r8], cl ; Store the byte in the destination (dest)
        dec rdx ; Decrement the count (n)
        inc r8 ; Move to the next byte
        jmp loop ; Jump back to the beginning of the loop

    end:
        mov rsp, rbp ; Restore the stack pointer
        pop rbp ; Pop the base pointer from the stack
        ret ; Return
