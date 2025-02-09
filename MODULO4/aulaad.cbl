       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA15.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 WS-REG-1.
           03 WS-CODIGO PIC 9(05).
           03 WS-NOME   PIC X(20).
           03 WS-TEL    PIC X(09).

       01 WS-REG-2.
           03 WS-CODIGO PIC 9(05).
           03 WS-NOME   PIC X(20).
           03 WS-TEL    PIC X(09).

       PROCEDURE DIVISION.

           MOVE '00001'           TO WS-CODIGO OF WS-REG-1.
           MOVE 'CARLOS GOMES'    TO WS-NOME OF WS-REG-1.
           MOVE '514-1234'        TO WS-TEL OF WS-REG-1.

           MOVE WS-CODIGO OF WS-REG-1 TO WS-CODIGO OF WS-REG-2.
           MOVE WS-NOME OF WS-REG-1   TO WS-NOME OF WS-REG-2.
           MOVE WS-TEL OF WS-REG-1    TO WS-TEL OF WS-REG-2.

           DISPLAY 'WS-REG-1:'.
           DISPLAY WS-REG-1.

           DISPLAY 'WS-REG-2:'.
           DISPLAY WS-REG-2.

       STOP RUN.
