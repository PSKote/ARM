	 AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
		;Check if even or odd
		;if Even make R6 to 2
		; if odd make R6 to 1
        MOV R2, #2 
		MOV R3, #4 ; number to check if even or odd
		;modulo operation
		UDIV R0, R3, R2
		MLS R1, R0, R2, R3
		;modulo ends here
		CMP R1, #0
		ITE NE
		MOVNE R6, #1 ; odd
		MOVEQ R6, #2 ; even
stop B stop ; stop program
     ENDFUNC
     END