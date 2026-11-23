

INCLUDE Irvine32.inc

.data
promptEmail BYTE "Enter your university email address: ", 0
userEmail   BYTE 100 DUP(0)
adminEmail  BYTE "admin@nu.edu.pk", 0
emailLen    DWORD ?

msgLen      BYTE "Email length: ", 0
msgValid    BYTE "Valid format: '@' found at index ", 0
msgInvalid  BYTE "Invalid format: '@' character not found.", 0
msgAdminEq  BYTE "This matches the administrator email.", 0
msgAdminNe  BYTE "This does not match the administrator email.", 0

.code
main PROC
    mov edx, OFFSET promptEmail
    call WriteString
    mov edx, OFFSET userEmail
    mov ecx, SIZEOF userEmail
    call ReadString

    INVOKE Str_length, ADDR userEmail
    mov emailLen, eax

    mov edx, OFFSET msgLen
    call WriteString
    call WriteDec
    call Crlf

    mov ecx, emailLen
    cmp ecx, 0
    je AtNotFound

    cld
    mov edi, OFFSET userEmail
    mov al, '@'
    repne scasb
    jnz AtNotFound

    dec edi
    mov eax, edi
    sub eax, OFFSET userEmail

    mov edx, OFFSET msgValid
    call WriteString
    call WriteDec
    call Crlf
    jmp CheckAdmin

AtNotFound:
    mov edx, OFFSET msgInvalid
    call WriteString
    call Crlf

CheckAdmin:
    INVOKE Str_compare, ADDR userEmail, ADDR adminEmail
    je IsAdmin

    mov edx, OFFSET msgAdminNe
    call WriteString
    jmp Done

IsAdmin:
    mov edx, OFFSET msgAdminEq
    call WriteString

Done:
    call Crlf
    exit
main ENDP
END main
