.model small
.stack 100h
.data
    msg db 'Enter password: $'
    output db 'Your password is: $'
    newline db 0ah,0dh,'$'
    
    charA db ?
    charB db ?
    charC db ?
    
.code

start:
    
    mov ax, @data
    mov ds, ax              ; For string printing
    
    mov ah, 09h
    lea dx, msg             ; Invoke Prompt
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 07h             ; Input
    int 21h
    mov charA, al           ; Move input
    
    mov ah, 02h             ; Invoke asterisk
    mov dl, '*'
    int 21h
    
    mov ah, 07h             ; Input
    int 21h
    mov charB, al           ; Move input
    
    mov ah, 02h             ; Invoke asterisk
    mov dl, '*'
    int 21h
    
    mov ah, 07h             ; Input
    int 21h
    mov charC, al           ; Move input
    
    mov ah, 02h             ; Invoke asterisk
    mov dl, '*'
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 09h
    lea dx, output          ; Invoke Prompt
    int 21h
    
    mov ah, 02h
    mov dl, charA           ; Invoke characters
    int 21h
    mov dl, charB
    int 21h
    mov dl, charC
    int 21h
    
    mov ah,4ch              ; Terminate
    int 21h

end start