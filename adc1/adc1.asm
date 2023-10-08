
_main:

;adc1.c,3 :: 		void main() {
;adc1.c,4 :: 		ANSEL  = 0x04;              // Configure AN2 pin as analog
	MOVLW      4
	MOVWF      ANSEL+0
;adc1.c,5 :: 		ANSELH = 0;                 // Configure other AN pins as digital I/O
	CLRF       ANSELH+0
;adc1.c,6 :: 		C1ON_bit = 0;               // Disable comparators
	BCF        C1ON_bit+0, BitPos(C1ON_bit+0)
;adc1.c,7 :: 		C2ON_bit = 0;
	BCF        C2ON_bit+0, BitPos(C2ON_bit+0)
;adc1.c,9 :: 		TRISA  = 0xFF;              // PORTA is input
	MOVLW      255
	MOVWF      TRISA+0
;adc1.c,10 :: 		TRISC  = 0;                 // PORTC is output
	CLRF       TRISC+0
;adc1.c,11 :: 		TRISD  = 0;                 // PORTB is output
	CLRF       TRISD+0
;adc1.c,13 :: 		do {
L_main0:
;adc1.c,14 :: 		temp_res = ADC_Read(2);   // Get 10-bit results of AD conversion
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _temp_res+0
	MOVF       R0+1, 0
	MOVWF      _temp_res+1
;adc1.c,15 :: 		PORTC = temp_res;         // Send lower 8 bits to PORTB
	MOVF       R0+0, 0
	MOVWF      PORTC+0
;adc1.c,16 :: 		PORTD = temp_res >> 8;    // Send 2 most significant bits to RC1, RC0
	MOVF       R0+1, 0
	MOVWF      R2+0
	CLRF       R2+1
	MOVF       R2+0, 0
	MOVWF      PORTD+0
;adc1.c,17 :: 		} while(1);
	GOTO       L_main0
;adc1.c,18 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
