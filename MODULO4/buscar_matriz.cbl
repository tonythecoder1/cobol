       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA15.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       DATA DIVISION.
       FILE SECTION.

       WORKING-STORAGE SECTION.

       01 WS-TABELA.
           03 WS-REGISTRO OCCURS 4 TIMES
                       ASCENDING KEY IS WS-CHAVE 
                       INDEXED BY I.
           05 WS-CHAVE PIC 99.
           05 WS-NOME PIC X(06).
       
       77 WS-COD PIC X(02).
           
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       MOVE '01MARCOS02CARLOS03MARINA04ANA   ' TO WS-TABELA.

       DISPLAY 'INSIRA O CODIGO DO UTILIZADOR: '.
       ACCEPT WS-COD.

       SEARCH ALL WS-REGISTRO
           AT END 
               DISPLAY 'DADO NAO ENCONTRADO'
           WHEN WS-CHAVE(I) = WS-COD

               DISPLAY 'ENCONTRADO: '
               DISPLAY ' '
               DISPLAY 'CHAVE: '    WS-CHAVE(I)
               DISPLAY 'NOME '    WS-NOME(I) 
       END-SEARCH.


       STOP RUN.