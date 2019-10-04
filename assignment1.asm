;Author: Ethan Kamus
;Email: ethanjpkamus@csu.fullerton.edu

global assignment
extern scanf
extern printf

segment .data

	welcome db "This program was made by: Ethan Kamus", 10, 0

	text1 db "Please enter the first integer: ", 0
	text2 db "You entered: %ld", 10, 0

	text3 db "Please enter the second integer: ", 0 
	text4 db "You entered: %ld", 10, 0

	textsum db "The sum of these integers is: %ld", 10, 0
	textprod db "The product of these integers is: %ld", 10, 0

	stringformat db "%s", 0

	integerformat db "%ld", 0

	textcaller db "The integer 5 will be returned to the caller", 10, 0

segment .bss
;empty

segment .text

assignment:
	
	push 	   rbp
	mov 	   rbp, rsp
	push       rbx
	push       rcx
	push       rdx
	push       rsi
	push       rdi
	push       r8
	push       r9
	push       r10
	push       r11
	push       r12                                              
	push       r13
	push       r14
	push       r15

;====== print the welcome statement =============================================================================

	mov qword	rax, 0
	mov		rdi, stringformat
	mov		rsi, welcome
	call 		printf

;====== ask user for first integer ==============================================================================

	mov qword	rax, 0
	mov		rdi, stringformat
	mov		rsi, text1
	call		printf
	
;====== get user input ==========================================================================================

	mov		rax, 0
	mov		rdi, integerformat
	push 		qword 0
	mov		rsi, rsp
	call		scanf
	pop 		r15
	
;====== tell user what they input ===============================================================================

	mov qword	rax, 0
	mov		rdi, text2
	mov		rsi, r15
	call 		printf
	
;====== ask user for second integer =============================================================================

	mov qword	rax, 0
	mov		rdi, stringformat
	mov		rsi, text3
	call		printf
	
;====== get user input ==========================================================================================

	mov		rax, 0
	mov		rdi, integerformat
	push 		qword 0
	mov		rsi, rsp
	call		scanf
	pop 		r14

;====== tell user what they input ===============================================================================

	mov qword	rax, 0
	mov		rdi, text4
	mov		rsi, r14
	call 		printf

;====== preserve numbers and find sum ===========================================================================	
	
	mov		r13, r15

	add		r15, r14
	
;====== print sum ===============================================================================================

	mov qword	rax, 0
	mov		rdi, textsum
	mov		rsi, r15
	call		printf

;====== find and print product ==================================================================================

	imul		r14, r13
 
	mov qword	rax, 0
	mov		rdi, textprod
	mov		rsi, r14
	call		printf

;====== print final prompt ======================================================================================
	
	mov qword	rax, 0
	mov		rdi, stringformat
	mov		rsi, textcaller
	call		printf

;====== return 5 to caller ======================================================================================

	mov rax, 5

	pop r15
	pop r14
	pop r13
	pop r12
	pop r11
	pop r10
	pop r9
	pop r8
	pop rdi
	pop rsi
	pop rdx
	pop rcx
	pop rbx
	pop rbp
	
	ret
	