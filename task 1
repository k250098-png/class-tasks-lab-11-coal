

INCLUDE Irvine32.inc

.data
oldDB       BYTE 101, 102, 103, 104, 105, 106, 107, 108
newDB       BYTE LENGTHOF oldDB DUP(?)

msgSuccess  BYTE "Synchronization successful: All student records match.", 0
msgMismatch BYTE "Synchronization failed! First mismatch at index: ", 0

.code
main PROC
    cld
    mov esi, OFFSET oldDB
    mov edi, OFFSET newDB
    mov ecx, LENGTHOF oldDB
    rep movsb

    cld
    mov esi, OFFSET oldDB
    mov edi, OFFSET newDB
    mov ecx, LENGTHOF oldDB
    repe cmpsb
    je SyncSuccess

    mov eax, esi
    sub eax, OFFSET oldDB
    dec eax

    mov edx, OFFSET msgMismatch
    call WriteString
    call WriteDec
    jmp Done

SyncSuccess:
    mov edx, OFFSET msgSuccess
    call WriteString

Done:
    call Crlf
    exit
main ENDP
END main
