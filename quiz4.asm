section .data
    ; Declare the variables and initialize them
    x dd 10       ; x = 10
    y dd 20       ; y = 20
    z dd 30       ; z = 30

section .bss
    result resd 1  ; Reserve a 4-byte space for the result

section .text
    global _start  ; Entry point for the program

_start:
    ; Call the add_three function
    call add_three

    ; Exit the program
    mov eax, 1     ; sys_exit
    int 0x80       ; Interrupt to call kernel

add_three:
    ; Load the values of x, y, z into registers
    mov eax, [x]   ; Move the value of x into eax
    mov ebx, [y]   ; Move the value of y into ebx
    mov ecx, [z]   ; Move the value of z into ecx

    ; Add the three values
    add eax, ebx   ; eax = eax + ebx (x + y)
    add eax, ecx   ; eax = eax + ecx (x + y + z)

    ; Store the result
    mov [result], eax  ; result = eax

    ; Return the result in eax (optional)
    ; Deallocation of memory isn't needed here as we didn't allocate any dynamic memory
    ret
