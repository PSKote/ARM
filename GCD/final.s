	 AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
		; GCD
		MOV R1, #5 ; fisrt number
		MOV R2, #2 ; second number
while	CMP R1, R2 ; while (a!=b)
		SUBGT R1, R1, R2 ; if (a>b) then a=a-b
		SUBLE R2, R2, R1 ; else b=b-a
		BNE while
		MOV R4, R1 ; move GCD to R4
stop B stop ; stop program
     ENDFUNC
     END