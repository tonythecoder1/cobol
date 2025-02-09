IDENTIFICATION DIVISION.
PROGRAM-ID. AULA8.
       DATA DIVISION.
       WORKING-STORAGE SECTION.
       
       77 WS-NUM1 PIC 9(02).
       77 WS-NUM2 PIC 9(02).
       77 WS-RES  PIC 9(03).
   
       PROCEDURE DIVISION.

           PERFORM P001-INICIO.
           PERFORM P500-CALC.
           PERFORM P999-FIM.

       P001-INICIO.
           
           INITIALIZE WS-NUM1
                      WS-NUM2.
           
           DISPLAY 'Numero 1 '.
           ACCEPT WS-NUM1.
           DISPLAY 'NUMERO 2 '.
           ACCEPT WS-NUM2.     

       P500-CALC.
           
           DISPLAY 'FUNCAO ADD: '
           ADD WS-NUM1 TO WS-NUM2
                       ON SIZE ERROR PERFORM P800-ERRO.
           DISPLAY 'Funcao add ' WS-NUM2.

           DISPLAY 'FUNCAO SUB: ' 
           SUBTRACT 2 FROM WS-NUM2
                    ON SIZE ERROR PERFORM P800-ERRO.
           DISPLAY 'Funcao add ' WS-NUM2.

           DISPLAY 'FUNCAO MULTI: ' 
           MULTIPLY 3 BY WS-NUM2 GIVING WS-NUM2
                    ON SIZE ERROR PERFORM P800-ERRO.
          
           DISPLAY 'Funcao add ' WS-NUM2.

           DISPLAY 'FUNCAO DIVIDIR: ' 
           DIVIDE 1 BY WS-NUM2 GIVING WS-NUM2
                    ON SIZE ERROR PERFORM P800-ERRO.

           DISPLAY 'Funcao add ' WS-NUM2.

       P800-ERRO.
           DISPLAY "ERRO DE PROCESSAMENTO".
           PERFORM P999-FIM.

       P999-FIM.
           STOP RUN.

       END PROGRAM AULA8.
