

INCLUDE Irvine32.inc

BubbleSort   PROTO, pArray: PTR DWORD, Count: DWORD
BinarySearch PROTO, pArray: PTR DWORD, Count: DWORD, searchVal: DWORD

.data
priorities  DWORD 42, 15, 8, 91, 23, 4, 67, 19
searchCode  DWORD ?

msgSorted   BYTE "Sorted priority codes: ", 0
msgPrompt   BYTE "Enter priority code to search: ", 0
msgFound    BYTE "Priority code found at sorted index: ", 0
msgNotFound BYTE "Requested priority code does not exist.", 0

.code
main PROC
    INVOKE BubbleSort, ADDR priorities, LENGTHOF priorities

    mov edx, OFFSET msgSorted
    call WriteString
    mov esi, OFFSET priorities
    mov ecx, LENGTHOF priorities
PrintLoop:
    mov eax, [esi]
    call WriteDec
    mov al, ' '
    call WriteChar
    add esi, TYPE priorities
    loop PrintLoop
    call Crlf

    mov edx, OFFSET msgPrompt
    call WriteString
    call ReadDec
    mov searchCode, eax

    INVOKE BinarySearch, ADDR priorities, LENGTHOF priorities, searchCode
    cmp eax, -1
    je NotFound

    mov edx, OFFSET msgFound
    call WriteString
    call WriteDec
    call Crlf
    jmp Done

NotFound:
    mov edx, OFFSET msgNotFound
    call WriteString
    call Crlf

Done:
    exit
main ENDP

BubbleSort PROC USES eax ecx esi,
    pArray: PTR DWORD,
    Count: DWORD

    mov ecx, Count
    dec ecx
    jle L4
L1:
    push ecx
    mov esi, pArray
L2:
    mov eax, [esi]
    cmp [esi + 4], eax
    jge L3
    xchg eax, [esi + 4]
    mov [esi], eax
L3:
    add esi, 4
    loop L2
    pop ecx
    loop L1
L4:
    ret
BubbleSort ENDP

BinarySearch PROC USES ebx ecx edx esi edi,
    pArray: PTR DWORD,
    Count: DWORD,
    searchVal: DWORD

    mov ebx, pArray
    mov edi, searchVal
    mov esi, 0
    mov edx, Count
    dec edx
L1:
    cmp esi, edx
    jg NotFound

    mov eax, esi
    add eax, edx
    shr eax, 1

    mov ecx, [ebx + eax * 4]
    cmp ecx, edi
    je Found
    jl Higher

    mov edx, eax
    dec edx
    jmp L1
Higher:
    mov esi, eax
    inc esi
    jmp L1
NotFound:
    mov eax, -1
Found:
    ret
BinarySearch ENDP

END main
