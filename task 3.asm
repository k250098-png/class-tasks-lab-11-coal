

INCLUDE Irvine32.inc

.data
msg         BYTE "EMERGENCY EVACUATION", 0
msgLen      = ($ - msg) - 1
revMsg      BYTE SIZEOF msg DUP(0)

msgOrig     BYTE "Original Message: ", 0
msgRev      BYTE "Reversed Message: ", 0

.code
main PROC
    mov edx, OFFSET msgOrig
    call WriteString
    mov edx, OFFSET msg
    call WriteString
    call Crlf

    std
    mov esi, OFFSET msg + msgLen - 1
    mov edi, OFFSET revMsg
    mov ecx, msgLen

ReverseLoop:
    movsb
    add edi, 2
    loop ReverseLoop

    mov BYTE PTR [edi], 0
    cld

    mov edx, OFFSET msgRev
    call WriteString
    mov edx, OFFSET revMsg
    call WriteString
    call Crlf

    exit
main ENDP
END main
