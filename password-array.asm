.model small
.stack 100h
.data
    msg db 'Enter password: $'
    output db 'Your password is: $'
    newline db 0ah,0dh,'$'
    password db ?,?,?,'$'   ; Credits to Daniel De Lara
    
    .code                   ; Arrayed version (optimized?)

start:
    
    mov ax, @data
    mov ds, ax              ; For string printing
    
    mov ah, 09h
    lea dx, msg             ; Invoke Prompt
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 07h             ; Input, do not use $
    int 21h
    mov password[0], al     ; Move input
    
    mov ah, 02h             ; Invoke asterisk
    mov dl, '*'
    int 21h
    
    mov ah, 07h             ; Input, do not use $
    int 21h
    mov password[1], al     ; Move input
   
    mov ah, 02h             ; Invoke asterisk
    int 21h
    
    mov ah, 07h             ; Input, do not use $
    int 21h
    mov password[2], al     ; Move input
    
    mov ah, 02h             ; Invoke asterisk
    int 21h
    
    mov ah, 09h
    lea dx, newline
    int 21h
    
    mov ah, 09h
    lea dx, output          ; Invoke Prompt
    int 21h
    
    mov ah, 09h
    lea dx, password        ; Invoke characters
    int 21h
    
    mov ah,4ch              ; Terminate
    int 21h

end start