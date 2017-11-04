	 AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
		; Largest of three numbers
		; largest number will be stored in R6
        MOV R2, #8 ; first number
		MOV R3, #2 ; second number
		MOV R4, #9 ; third number
		CMP R2, R3 ; if (a>b) then go to first
		IT GE
		BGE first
		CMP R3, R4 ; if (b>c) then go to second
		IT GE
		BGE second
first	CMP R2, R4 ; if (a>c) then a is largest Else third
		ITE GE
		MOVGE R6, R2 ; store 'a' as largest
		BLT third
		B stop
second	MOV R6, R3 ; store 'b' as largest 
		B stop
third	MOV R6, R4 ; store 'c' as largest
stop B stop ; stop program
     ENDFUNC
     END