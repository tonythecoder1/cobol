       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA11.
       DATA DIVISION.
       WORKING-STORAGE SECTION.

       01 WS-VAR.
           02 WS-NUM1 PIC 9.
           02 WS-NUM2 PIC 9.
           02 WS-STATUS PIC 9.
           02 WS-I PIC 9.
           02 WS-COUNT PIC 9(02).
           02 WS-TT    PIC X.
           02 WS-IND   PIC 9.

       PROCEDURE DIVISION.
           
           PERFORM P100-INICIO.

           P100-INICIO.
           INITIALIZE WS-IND.

           PERFORM P200-CALC THRU P200-FIM 9 TIMES.
           PERFORM P300-CALC THRU P300-CALC-FIM.

           PERFORM VARYING WS-IND FROM 1 BY 1 UNTIL WS-IND = 3
           END-PERFORM.

           DISPLAY "OIIII " WS-IND.
           PERFORM P999-FIM.

       P200-CALC.
           ADD 1 TO WS-COUNT.
           DISPLAY WS-COUNT.

       P200-FIM.
                    
       P300-CALC.

           PERFORM WS-COUNT TIMES 
               ADD 1 TO WS-I
           END-PERFORM

           PERFORM WITH TEST BEFORE UNTIL WS-TT ='A'
               DISPLAY 'INSERE A OU B'
               ACCEPT WS-TT
           END-PERFORM

           DISPLAY 'O valor de I é: ' WS-I.
                  P300-CALC-FIM. 

       P999-FIM.
           STOP RUN.


       END PROGRAM AULA11.