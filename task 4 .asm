

INCLUDE Irvine32.inc

.data
attendance  BYTE 1, 1, 1, 0, 1, 1, 0, 1
msgAbsent   BYTE "First absent employee found at index: ", 0
msgAllPres  BYTE "Every employee is present.", 0
msgCount    BYTE "Total present employees: ", 0

.code
main PROC
    mov esi, OFFSET attendance
    mov ecx, LENGTHOF attendance
    mov ebx, 0

CountLoop:
    cmp BYTE PTR [esi], 1
    jne NextEmp
    inc ebx
NextEmp:
    inc esi
    loop CountLoop

    cld
    mov edi, OFFSET attendance
    mov al, 0
    mov ecx, LENGTHOF attendance
    repne scasb
    jnz AllPresent

    dec edi
    mov eax, edi
    sub eax, OFFSET attendance

    mov edx, OFFSET msgAbsent
    call WriteString
    call WriteDec
    call Crlf
    jmp ShowCount

AllPresent:
    mov edx, OFFSET msgAllPres
    call WriteString
    call Crlf

ShowCount:
    mov edx, OFFSET msgCount
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf

    exit
main ENDP
END main
