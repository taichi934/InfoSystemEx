LIST P = PIC18F25K22;
INCLUDE "P18F25K22.INC";

CONFIG FOSC = HSMP;
CONFIG WDTEN = OFF;
CONFIG LVP = OFF;

ORG 0;
BANKSEL TRISB;
CLRF TRISB;
BANKSEL ANSELB;
CLRF ANSELB;
BANKSEL PORTB;
CLRF PORTB;

BANKSEL TRISA;
CLRF TRISA;
BANKSEL TRISA;
BSF TRISA,2;
BANKSEL PORTA;
BSF TRISA,3;
BANKSEL ANSELA;
CLRF ANSELA;
BANKSEL PORTA;
CLRF PORTA

LOOP NOP;
BTFSS PORTA,2;
CALL BEAP;
GOTO LOOP;


BEAP BCF PORTA,5;
BCF PORTB,0;
CALL REST;
BSF PORTA,5;
BSF PORTB,0;
RETURN;

REST NOP;
CNT EQU H'0';
CNT2 EQU H'1';

MOVLW D'50';
MOVWF CNT
LOOP1 MOVLW D'10';
MOVWF CNT2;
LOOP2 NOP
DECFSZ CNT2,1;
GOTO LOOP2
DECFSZ CNT,1
GOTO LOOP1;
RETURN;
END;

