%include "io64.inc"

section .text
global main
main:
    mov rbp, rsp; for correct debugging
    mov ax, 39 ; 입력 부분
    
    ; 100인지 확인
    cmp ax, 100
    je hundred
    jmp not_hundred
    
    hundred: ; 100이면 그냥 출력
     PRINT_STRING "100"
     JMP end
    
    not_hundred: ; 100이 아니면 각 자리가 3,6,9인지 확인

     mov bl, 10
     div bl
     mov bl, ah
     mov cl, ah
     mov dl, al
      
     MOVZX ax, al
        
     ; 첫째 자리 숫자가 0인지 확인
     cmp dl, 0
     je just_zero
     jmp not_zero
    
    just_zero: ; 첫째 자리 숫자가 0이면 나눗셈 연산하지 말고 그냥 0 그대로 출력
     PRINT_DEC 1,dl
     JMP n1
     
    not_zero: ; 첫째 자리 숫자가 0이 아니면 나눗셈 연산 해서 3,6,9 인지 확인
     mov bl, 3
     div bl
    
     mov bl, ah
        
     cmp bl, 0 ; 첫째 자리를 3으로 나눈 나머지가 0인지 확인
     je Zero
     jmp No_zero
    
    
    Zero: ; 첫째 자리가 3으로 나누어 떨어지면(3,6,9이면) "_" 출력
      PRINT_STRING "_"
      JMP NEXT
    
    No_zero: ; 첫째 자리가 3으로 나누어 떨어지지 않으면 숫자 출력
      PRINT_DEC 1, dl

    n1:
    NEXT:
    ; 둘째 자리가 0인지 확인
    cmp cl, 0
    je just_zero2
    jmp not_zero2
    
    just_zero2: ; 둘째 자리 숫자가 0이면 그냥 0 그대로 출력
     PRINT_DEC 1,cl
     JMP n2
    not_zero2: ; 둘째 자리 숫자가 0이 아니면 나눗셈 연산해서 3,6,9인지 확인
     MOVZX ax, cl
     mov bl, 3
     div bl
    
     mov bl, ah
    
     cmp bl, 0
     je Zero2
     jmp No_zero2
    
    Zero2: ; 둘째 자리 숫자가 3으로 나누어떨어지면(3,6,9이면) "_" 출력
     PRINT_STRING "_"
     JMP NEXT2
    
    No_zero2: ; 둘째 자리 숫자가 3으로 나누어떨어지지 않으면 숫자 출력
     PRINT_DEC 1, cl
 
    n2:
    NEXT2:
    end:
    NEWLINE
     
    xor rax, rax
    ret
    
section .data
    
section .bss
