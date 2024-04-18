
_main:

;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,12 :: 		void main()          // inicio de programa
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,15 :: 		ANSEL=0x00; // Se desactivan los puertos analogos
	CLRF       ANSEL+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,16 :: 		ANSELH=0x00;
	CLRF       ANSELH+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,17 :: 		C1ON_bit=0; // Desactivamos comparadores ADC
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,18 :: 		c2on_bit=0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,19 :: 		TRISC=0x00; // Configuramos puerto C como salida
	CLRF       TRISC+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,20 :: 		TRISB=0x01; // Configuramos bit 0 del puerto B como Entrada
	MOVLW      1
	MOVWF      TRISB+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,21 :: 		PORTB=0x01; // Valor inicial de 1 en el bit 0 del puerto B
	MOVLW      1
	MOVWF      PORTB+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,22 :: 		PORTC=0x00; // Todos los bits del puerto C inician en estado bajo
	CLRF       PORTC+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,24 :: 		while(1)  // ciclo infinito para que se ejecute constantemente el codigo
L_main0:
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,26 :: 		if(PORTB.F0==0) // si el bit o del puerto B es 0 entonces se ejecuta la funcion conteo
	BTFSC      PORTB+0, 0
	GOTO       L_main2
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,28 :: 		conteo();
	CALL       _conteo+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,29 :: 		}
L_main2:
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,30 :: 		}
	GOTO       L_main0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

_conteo:

;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,33 :: 		void conteo()
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,35 :: 		PORTC=TABLA[unidades]; // aqui se depositan los valores que se mostraran en el display
	MOVF       _unidades+0, 0
	ADDLW      _TABLA+0
	MOVWF      FSR
	MOVF       INDF+0, 0
	MOVWF      PORTC+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,36 :: 		unidades++; // incremento en uno a unidades
	INCF       _unidades+0, 1
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,37 :: 		delay_ms(500);   // retardo de 1/2 segundo
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_conteo3:
	DECFSZ     R13+0, 1
	GOTO       L_conteo3
	DECFSZ     R12+0, 1
	GOTO       L_conteo3
	DECFSZ     R11+0, 1
	GOTO       L_conteo3
	NOP
	NOP
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,38 :: 		if(unidades==10) // si unidades es igual a 10 entonces sera puesto a 0
	MOVF       _unidades+0, 0
	XORLW      10
	BTFSS      STATUS+0, 2
	GOTO       L_conteo4
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,40 :: 		unidades=0; // se pone a cero para iniciar de nuevo el conteo
	CLRF       _unidades+0
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,42 :: 		}
L_conteo4:
;CONTADOR DE 0 A 9 CON DISPLAY 7 SEG.c,43 :: 		}
L_end_conteo:
	RETURN
; end of _conteo
