IDENTIFICATION DIVISION.
PROGRAM-ID. AULA9.
DATA DIVISION.
WORKING-STORAGE SECTION.

       01 WS-VAR.
           02 WS-NUM1 PIC S9(04)V99 VALUE ZEROES.
           02 WS-NUM2 PIC S9(04)V99.
           02 WS-TEXTO PIC X(20).
           02 WS-STATUS PIC 9(01).
           02 WS-LINHA  PIC 99.
           02 WS-CODIGO PIC 9.
           02 WS-CAMPO  PIC 99.
           02 WS-DADO   PIC 99.

PROCEDURE DIVISION.

       PERFORM P100-INICIALIZA.
       PERFORM P200-CALC.
       PERFORM P999-FIM.

P100-INICIaLIZA.
       INITIALIZE WS-VAR.

P200-CALC.
       
       MOVE 5 TO WS-NUM2.
       MOVE 'TEXTO' TO WS-TEXTO.

       COMPUTE WS-NUM1 = WS-NUM1 + (WS-NUM2 * 3)
                                   ON SIZE ERROR PERFORM P300-ERRO.

       IF WS-NUM2 IS NUMERIC THEN 
           DISPLAY 'CAMPO NUMERICO'
       ELSE 
           DISPLAY 'NAO NUMERICO'
           PERFORM P300-ERRO
       END-IF.

       DISPLAY 'INSIRA UM VALOR ENTRE 0 E 1 '
       ACCEPT WS-STATUS.


    IF WS-STATUS GREATER THAN OR EQUAL TO 1 THEN 
        PERFORM P400-ERRO
    ELSE 
        IF WS-STATUS LESS THAN 0 THEN 
            PERFORM P450-ERRO
        ELSE 
            DISPLAY '2 SE'
        END-IF
    END-IF.

       DISPLAY 'N Linha ?'
       ACCEPT WS-LINHA.

       DISPLAY 'CODIGO ?'
       ACCEPT WS-CODIGO.

       DISPLAY 'CAMPO ?'
       ACCEPT WS-CAMPO.

       DISPLAY 'NUMERO DO DADO'
       ACCEPT WS-DADO.

       IF WS-LINHA GREATER THAN 30 
           DISPLAY 'LINHA MAIOR QUE 30'
       ELSE 
           DISPLAY 'Linha menor'.
        
       IF WS-CODIGO = 2
           DISPLAY 'Codigo Igual a 2'
       ELSE 
           DISPLAY 'CODIGO MENOR OU MAIOR QUE 2 '.

       IF WS-CAMPO NOT LESS WS-DADO
           DISPLAY 'OK'
       ELSE
           DISPLAY 'OKOKOKOK'.
       
       COMPUTE WS-NUM2 = WS-DADO * WS-LINHA.

       DISPLAY 'NUM2 ' WS-NUM2.

       IF WS-NUM2 IS POSITIVE 
           DISPLAY 'POSITIVO'.

           
           IF (WS-NUM2 * 10) GREATER THAN 10
               DISPLAY 'MUITO MAIOR'
           ELSE 
               DISPLAY 'MENOR'.


       



P400-ERRO.
       DISPLAY 'ERRO VALOR MAIOR QUE 1'.
       PERFORM P999-FIM.

P450-ERRO.
       DISPLAY 'ERRO VALOR MENOR QUE 0'.
       PERFORM P999-FIM.

P300-ERRO.
       DISPLAY 'ERRO DE PROCESSAMENTO'.
       PERFORM P999-FIM.

P999-FIM.
      STOP RUN.

END PROGRAM AULA9.

