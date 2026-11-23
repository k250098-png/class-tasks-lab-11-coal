

INCLUDE Irvine32.inc

.data
bookTitle1  BYTE "Computer Organization and Assembly", 0
bookTitle2  BYTE "Computer Organization and Design", 0

msgEqual    BYTE "The two book titles are identical.", 0
msgGreater1 BYTE "Title 1 is greater than Title 2.", 0
msgGreater2 BYTE "Title 2 is greater than Title 1.", 0
msgDiffIdx  BYTE "First differing character at index: ", 0

.code
main PROC
    INVOKE Str_compare, ADDR bookTitle1, ADDR bookTitle2
    jb Title2Greater
    je TitlesIdentical

    mov edx, OFFSET msgGreater1
    call WriteString
    call Crlf
    jmp FindMismatch

Title2Greater:
    mov edx, OFFSET msgGreater2
    call WriteString
    call Crlf
    jmp FindMismatch

TitlesIdentical:
    mov edx, OFFSET msgEqual
    call WriteString
    call Crlf
    jmp Done

FindMismatch:
    cld
    mov esi, OFFSET bookTitle1
    mov edi, OFFSET bookTitle2
    mov ecx, LENGTHOF bookTitle1
    repe cmpsb

    mov eax, esi
    sub eax, OFFSET bookTitle1
    dec eax

    mov edx, OFFSET msgDiffIdx
    call WriteString
    call WriteDec
    call Crlf

Done:
    exit
main ENDP
END main
