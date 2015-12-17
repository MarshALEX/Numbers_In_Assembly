TITLE Program_1			(Program_1.asm)

; Program Description:This program has the user enter two numbers
;		and then produces the sum, difference, product, quotient,
;		and remainder of those numbers.  The program then loops to
;		see if the user would like to enter two new numbers and go
;		through the process again.
; Author:Alex Marsh
; Date Created:July 5, 2015
; Last Modification Date:July 5, 2015

INCLUDE Irvine32.inc

; (insert symbol definitions here)

.data

a DWORD ?
b DWORD ?
sum DWORD ?
difference DWORD ?
product DWORD ?
quotient DWORD ?
remainder DWORD ?
answer DWORD ?
myName BYTE "Program 1                   by: Alex Marsh",0
extraCredit1 BYTE "***EC1: Program repeats until user chooses to quit.",0
extraCredit2 BYTE "***EC2: Program verifies second number less than first.",0
intro1 BYTE "Enter two numbers, and I'll show you the sum,",0
intro2 BYTE "difference, product, (integer)quotient, and remainder",0
intro3 BYTE "of those numbers.  Let's go!",0
prompt1 BYTE "First number: ",0
prompt2 BYTE "Second number: ",0
invalid1 BYTE "Sorry, your second number was less than the first.",0
invalid2 BYTE "So we switched your values.",0
aDisplay BYTE "A is ",0
bDisplay BYTE "B is ",0
sumDisplay BYTE "Sum is ",0
diffDisplay BYTE "Difference is ",0
prodDisplay BYTE "Product is ",0
quotDisplay BYTE "Quotient is ",0
remainDisplay BYTE "Remainder is ",0
continue1 BYTE "That was fun.  Do you want to do it again?",0
continue2 BYTE "1.) Yes",0
continue3 BYTE "2.) No ",0
goodBye1 BYTE "Impressed? ",0
goodBye2 BYTE "I thought so. You are welcome.",0
goodBye3 BYTE "This is goodbye for now. See you next time! Bye!",0


; (insert variables here)

.code
main PROC

; (insert executable instructions here)

;Display title
	mov edx,OFFSET myName
	call WriteString
	call Crlf
	call Crlf

;Display extraCredit 1
	mov edx,OFFSET extraCredit1
	call WriteString
	call Crlf

;Display extraCredit 2
	mov edx,OFFSET extraCredit2
	call WriteString
	call Crlf
	call Crlf

;Display intro line 1
	mov edx,OFFSET intro1
	call WriteString
	call Crlf

;Display intro line 2
	mov edx,OFFSET intro2
	call WriteString
	call Crlf

;Display intro line 3
	mov edx,OFFSET intro3
	call WriteString
	call Crlf

again: 

;Display prompt 1
	mov edx,OFFSET prompt1
	call WriteString
 
;get an integer for a
	call ReadInt
	mov a,eax
	
;Display prompt 2
	mov edx,OFFSET prompt2
	call WriteString

;get an integer for b
	call ReadInt
	mov b,eax
	
;validate the input
	mov ebx, a   ;a is in ebx, b is in eax
	cmp eax, ebx
	jbe inputOK

;if a < b, swap a and b values
	mov a, eax
	mov b, ebx

;display values have been switched line 1	
	call Crlf
	mov edx,OFFSET invalid1
	call WriteString
	call Crlf

;display values have been switched	line 2
	mov edx,OFFSET invalid2
	call WriteString
	call Crlf

inputOk:
;display a
	call Crlf
	mov edx,OFFSET aDisplay
	call WriteString
	mov eax, a
	call WriteDec
	call Crlf
	

;display b
	mov edx,OFFSET bDisplay
	call WriteString
	mov eax, b
	call WriteDec
	call Crlf 

;get sum of numbers
	call Crlf
	mov eax, a
	add eax, b
	mov sum, eax

;display sum
	mov edx,OFFSET sumDisplay
	call WriteString
	mov eax, sum
	call WriteDec
	call Crlf 

;get difference of numbers
	mov eax, a
	sub eax, b
	mov difference, eax

;display difference
	mov edx,OFFSET diffDisplay
	call WriteString
	mov eax, difference
	call WriteDec
	call Crlf 

;get product of number
	mov eax, a
	mov ebx, b
	mul ebx
	mov product, eax

;display product
	mov edx,OFFSET prodDisplay
	call WriteString
	mov eax, product
	call WriteDec
	call Crlf 

;get the quotient and remainder
	mov edx, 0
	mov eax, a
	mov ebx, b
	div ebx
	mov quotient, eax
	mov remainder, edx

;display the quotient
	mov edx,OFFSET quotDisplay
	call WriteString
	mov eax, quotient
	call WriteDec
	call Crlf

;display the remainder
	mov edx,OFFSET remainDisplay
	call WriteString
	mov eax, remainder
	call WriteDec
	call Crlf

;Display prompt asking if user wants to go again line 1
	call Crlf
	mov edx,OFFSET continue1
	call WriteString
	call Crlf

;Display prompt asking if user wants to go again line 2
	call Crlf
	mov edx,OFFSET continue2
	call WriteString

;Display prompt asking if user wants to go again line 3
	call Crlf
	mov edx,OFFSET continue3
	call WriteString
	call Crlf

;get answer from user
	call ReadInt
	mov answer,eax
	mov edx, 1
	cmp edx, answer
	je again

;Display goodbye line 1
	call Crlf
	mov edx,OFFSET goodBye1
	call WriteString
	call Crlf

;Display goodbye line 2
	mov edx,OFFSET goodBye2
	call WriteString
	call Crlf

;Display goodbye line 3
	mov edx,OFFSET goodBye3
	call WriteString
	call Crlf
	call Crlf
	
	 

	exit		; exit to operating system
main ENDP

; (insert additional procedures here)

END main