IDENTIFICATION DIVISION.
PROGRAM-ID. TESTE.

ENVIRONMENT DIVISION.

DATA DIVISION.

WORKING-STORAGE SECTION.

       01 WS-ARRAY-REGISTOS.
           05 NUM-REGISTOS OCCURS 10 TIMES INDEXED BY IDX.
           10 NUM-VALOR PIC 9(10).

           PROCEDURE DIVISION.

       PERFORM VARYING IDX FROM 1 BY 1 UNTIL IDX > 10
       MOVE IDX TO NUM-VALOR (IDX)
       DISPLAY 'Elemento ' IDX ': ' NUM-VALOR (IDX)
       END-PERFORM.

       DISPLAY NUM-REGISTOS (2).

       STOP RUN.
