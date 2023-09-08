#include "p16F887.inc"    
; CONFIG1
; __config 0x28D5
 __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_OFF & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_OFF & _FCMEN_ON & _LVP_OFF
; CONFIG2
; __config 0x3FFF
 __CONFIG _CONFIG2, _BOR4V_BOR40V & _WRT_OFF

  LIST p=16F887
   
  
N EQU 0xD0
cont1 EQU 0x20
cont2 EQU 0x21
cont3 EQU 0x22
var EQU 0X23
sol EQU 0X24

 
 
 
    ORG	0x00
    GOTO INICIO
    
INICIO
     BCF STATUS,RP0   ;RP0 = 0
    BCF STATUS,RP1  ;RP1 = 0
    CLRF PORTA	;PORTA = 0
    CLRF PORTB ;PORT SECUENCIA LED
    ;MOVLW B'0000000'  ;
    ;MOVWF PORTA
    BSF STATUS, RP0 ;RP0 = 1
    CLRF TRISA
    CLRF TRISB	;SECUENCIA SALIDA
    BSF STATUS,RP1
    CLRF ANSELH
    BCF STATUS,RP0  ;BANK O RP1=0 RP0=0
    BCF STATUS,RP1

    MOVLW 0x01
    MOVWF PORTB
    
    
LOOP
    
    MOVLW 16
    MOVWF var 
    
    
SECUENCIA1
    RLF PORTB
    CALL RETARDO
    DECFSZ var, 1
    GOTO SECUENCIA1
    
    MOVLW 16
    MOVWF var      
SECUENCIA2
    RRF PORTB
    CALL RETARDO
    DECFSZ var, 1
    GOTO SECUENCIA2
    

    
    MOVLW 0XF0
    MOVWF PORTB
    
    MOVLW 16
    MOVWF var    
SECUENCIA4
    SWAPF PORTB
    CALL RETARDO
    DECFSZ var, 1
    GOTO SECUENCIA4

    
    MOVLW 0xA1
    MOVWF PORTB  
    
    MOVLW 0x00
    MOVWF sol

    
;___________________________ Secuencia ejecicio #3 ___________________________
    
    LOOP7
    MOVLW 0xA1 ; //Hex value to display the number 1.0.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 52h; //Hex value to display the number 1.1.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0xA4 ; //Hex value to display the number 1.2.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 58h ; //Hex value to display the number 1.3.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    
    MOVLW 0xA8 ; //Hex value to display the number 1.4.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 54h ; //Hex value to display the number 1.5.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0xA2 ; //Hex value to display the number 1.6.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    
    MOVLW 51h ; //Hex value to display the number 1.7.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO
    
    MOVLW 0x81
    MOVWF PORTB  
    
    MOVLW 0x00
    MOVWF sol
;___________________________ Secuencia ejecicio #5 _________________________

LOOP8
    
    MOVLW 81h ; //Hex value to display the number 2.0.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0xC3 ; //Hex value to display the number 2.1.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0xE7 ; //Hex value to display the number 2.2.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0xFF ; //Hex value to display the number 2.3.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 18h ; //Hex value to display the number 2.4.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0x3C ; //Hex value to display the number 2.5.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0x7E ; //Hex value to display the number 2.6.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    MOVLW 0xFF ; //Hex value to display the number 2.7.
    MOVWF PORTB
    CALL RETARDO
    CALL RETARDO

    GOTO SECUENCIA1

;_____________________________________________________________________________
   
RETARDO
    MOVLW N
    MOVWF cont1
    
REP_1
    MOVLW N
    MOVWF cont2
    
REP_2
    DECFSZ cont2,1
    GOTO REP_2
    DECFSZ cont1,1
    GOTO REP_1
    RETURN
   
    END