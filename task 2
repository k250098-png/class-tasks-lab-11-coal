

INCLUDE Irvine32.inc

.data
system1     DWORD 1001, 1002, 1003, 1004, 1005
system2     DWORD 1001, 1002, 1099, 1004, 1005

msgMatch    BYTE "All patient records match across both systems.", 0
msgDiff     BYTE "Mismatch detected at index: ", 0
msgSys1     BYTE "System 1 Patient ID: ", 0
msgSys2     BYTE "System 2 Patient ID: ", 0
msgMatched  BYTE "Total matching records before first mismatch: ", 0

.code
main PROC
    cld
    mov esi, OFFSET system1
    mov edi, OFFSET system2
    mov ecx, LENGTHOF system1
    mov ebx, 0

CompareLoop:
    cmpsd
    jne MismatchFound
    inc ebx
    loop CompareLoop

    mov edx, OFFSET msgMatch
    call WriteString
    call Crlf
    mov edx, OFFSET msgMatched
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf
    jmp Done

MismatchFound:
    mov edx, OFFSET msgDiff
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf

    mov edx, OFFSET msgSys1
    call WriteString
    mov eax, [esi - 4]
    call WriteDec
    call Crlf

    mov edx, OFFSET msgSys2
    call WriteString
    mov eax, [edi - 4]
    call WriteDec
    call Crlf

    mov edx, OFFSET msgMatched
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf

Done:
    exit
main ENDP
END main
