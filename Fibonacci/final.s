	 AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION	
		; Fibonacci Series
        MOV R1, #0 ; First number
		MOV R2, #1 ; Second number
		MOV R3, #10 ; Total 13 numbers will be displayed
		MOV R4, #0x20000000 ; address where fibonacci numbers will be saved
		STR R1, [R4] ; storing first number
		ADD R4, #0x4 ; increasing address
		STR R2, [R4] ; storing second number
		ADD R4, #0x4 ; increasing address
		MOV R5, #0 ; temporary register
loop	CMP R3, #0 
		ADD R5, R1, R2 ; getting fibonacci number
		MOV R1, R2
		MOV R2, R5
		STR R5, [R4] ; storing numbers
		ADD R4, #0x4 ; increasing address
		SUBGT R3, R3, #1
		BGT loop
stop B stop ; stop program
     ENDFUNC
     END