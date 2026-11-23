

INCLUDE Irvine32.inc

.data
promptName  BYTE "Enter customer's full name: ", 0
inputName   BYTE 100 DUP(0)
origName    BYTE 100 DUP(0)
upperBuffer BYTE 100 DUP(0)
charCount   DWORD ?

msgOrig     BYTE "Original Name   : ", 0
msgUpper    BYTE "Uppercase Name  : ", 0
msgLen      BYTE "Character Count : ", 0

.code
main PROC
    mov edx, OFFSET promptName
    call WriteString
    mov edx, OFFSET inputName
    mov ecx, SIZEOF inputName
    call ReadString

    INVOKE Str_copy, ADDR inputName, ADDR origName

    INVOKE Str_length, ADDR inputName
    mov charCount, eax

    INVOKE Str_ucase, ADDR inputName

    INVOKE Str_copy, ADDR inputName, ADDR upperBuffer

    mov edx, OFFSET msgOrig
    call WriteString
    mov edx, OFFSET origName
    call WriteString
    call Crlf

    mov edx, OFFSET msgUpper
    call WriteString
    mov edx, OFFSET upperBuffer
    call WriteString
    call Crlf

    mov edx, OFFSET msgLen
    call WriteString
    mov eax, charCount
    call WriteDec
    call Crlf

    exit
main ENDP
END main
