	 AREA     appcode, CODE, READONLY
     EXPORT __main
	 ENTRY 
__main  FUNCTION		 
        ; Queue is considered to be made of interger.
		; So, the pointer is increased by 0x4. 
		; R3 is tail pointer, R4 is head pointer.
		; Queue starts from #0x20000000. Queue size is 7.
		; Size of the queue is stored in R6.
		; Intially memory is 0. When the queue is dequed
		; memory is filled with 0xFF. Random nummbers 
		; to be filled in queue is created by adding 1
		; to previous number (this is stored in R1)
		MOV R4, #0x20000000 ; head pointer
		MOV R3, #0x20000000 ; tail pointer
		MOV R6, #6 ; queue size
		MOV R1, #1 ; random nuber
		MOV R5, #0xFF ; random number
		; circular queue creation
loop	CMP R6, #0
		STR R5, [R3]
		ADD R3, #0x4 ; increasing tail pointer
		SUBGT R6, R6, #1
		BGT loop
		MOV R6, #6
		MOV R3, #0x20000000 ; tail pointer 
		;Enqueue to queue
loop1	CMP R6, #0
		STR R1, [R3]
		ADD R3, #0x4 ; increasing tail pointer
		ADD R1, #1 ; random number generation
		SUBGT R6, R6, #1
		BGT loop1
		MOV R6, #2
		; Dequeue from queue
loop2 	CMP R6, #0
		LDR R2, [R4]
		STR R5, [R4]
		ADD R4, #0x4 ; increasing head pointer
		SUBGT R6, R6, #1
		BGT loop2
		MOV R3, #0x20000000
		MOV R6, #2
		; Enqueue to queue
loop3 	CMP R6, #0
		STR R1, [R3]
		ADD R3, #0x4 ; increasing tail pointer
		ADD R1, #1 ; random number generation
		SUBGT R6, R6, #1
		BGT loop3
		MOV R6, #3
		; Dequeue from queue
loop4	CMP R6, #0
		LDR R2, [R4]
		STR R5, [R4]
		ADD R4, #0x4 ; increasing head pointer
		SUBGT R6, R6, #1
		BGT loop4
		MOV R4, #0x20000000 ; looping tail pointer around
		MOV R6, #2
		; Empty queue
loop5	CMP R6, #0
		LDR R2, [R4]
		STR R5, [R4]
		ADD R4, #0x4 ; increasing head pointer
		SUBGT R6, R6, #1
		BGT loop5
stop B stop ; stop program
     ENDFUNC
     END