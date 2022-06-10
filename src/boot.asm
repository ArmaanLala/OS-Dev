;================
; boot.asm
 
[ORG 0x7c00]     ; add to offsets
   jmp main
 
main:   
    xor ax, ax   ; make it zero
    mov ds, ax   ; DS=0
    cld          ; Clears the direction flags, 
                 ; now SI will increment on string operations

    mov si, msg  ; Copies the message into SI
    call print


inf_loop:
    jmp $

msg   db 'Lala OS Bootloader', 13, 10, 0

print:
    lodsb        ; Load byte at address DS:(E)SI into AL
    or al, al    ; if 0, then string is over
    jz done
    mov ah, 0x0E ; Tricks the bios into allowing interrups in real mode
    mov bh, 0
    int 0x10     ; Prints the character in Si to the screen
    jmp print    ; Loop until the string is finished

done:
    ret

times 510-($-$$) db 0
db 0x55
db 0xAA


    
    