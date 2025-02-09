       IDENTIFICATION DIVISION.
       PROGRAM-ID. MENUCNTT.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.

           01 WS-COM-AREA.
               03 WS-COM-MSG PIC X(20).
           
           77 WS-OP PIC 9(05).

       PROCEDURE DIVISION.

       MAIN-PROCEDURE.

           MOVE ZEROES TO WS-OP.

           DISPLAY ' *** MENU: OP 1 - OP 2 - OP 3 - OP 4- *** '
           ACCEPT WS-OP.
           
           EVALUATE WS-OP
               WHEN 1 
                   CALL 'ficheiro_index.o' USING WS-COM-AREA
           END-EVALUATE.
           


       
       END PROGRAM MENUCNTT.