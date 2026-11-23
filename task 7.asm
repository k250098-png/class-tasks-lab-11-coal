

INCLUDE Irvine32.inc

.data
promptFb    BYTE "Enter customer feedback: ", 0
feedback    BYTE 200 DUP(0)
cleanBuffer BYTE 200 DUP(0)
finalLen    DWORD ?

msgClean    BYTE "Cleaned Feedback : ", 0
msgLen      BYTE "Final Length     : ", 0

.code
main PROC
    mov edx, OFFSET promptFb
    call WriteString
    mov edx, OFFSET feedback
    mov ecx, SIZEOF feedback
    call ReadString

    INVOKE Str_trim, ADDR feedback, ' '

    INVOKE Str_ucase, ADDR feedback

    INVOKE Str_length, ADDR feedback
    mov finalLen, eax

    INVOKE Str_copy, ADDR feedback, ADDR cleanBuffer

    mov edx, OFFSET msgClean
    call WriteString
    mov edx, OFFSET cleanBuffer
    call WriteString
    call Crlf

    mov edx, OFFSET msgLen
    call WriteString
    mov eax, finalLen
    call WriteDec
    call Crlf

    exit
main ENDP
END main
