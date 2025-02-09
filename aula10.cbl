IDENTIFICATION DIVISION.
PROGRAM-ID. AULA10.
DATA DIVISION.
WORKING-STORAGE SECTION.

       01 WS-VAR.
           02 WS-NUM1 PIC 9(10).
           02 WS-NUM2 PIC 9(10).
           02 WS-OP PIC 9.


PROCEDURE DIVISION.

       PERFORM P100-INICIO.
       PERFORM P200-MENU.

       

P100-INICIO.
       INITIALIZE WS-VAR.

       DISPLAY 'INSERE A OPÇAO'.
       DISPLAY ' '.
       DISPLAY '1 - MENU, 2 - CONFIGURAÇOES, 3 - VERIFICAR'.
       ACCEPT WS-OP.

P200-MENU.
      EVALUATE WS-OP
               WHEN 1
                   DISPLAY 'ESCOLHESTE A OPCAO 1'
               WHEN 2
                   DISPLAY 'ESCOLHESTE A OPCAO 2'
               WHEN 3
                   DISPLAY 'SAISTE DO PROGRAMA'
                   PERFORM P999-FIM
               WHEN OTHER
                   DISPLAY 'OPCAO INVALIDA'
                   PERFORM P999-FIM.
           END-EVALUATE.



P999-FIM.
       STOP RUN.


END PROGRAM AULA10.

