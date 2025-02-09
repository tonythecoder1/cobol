       IDENTIFICATION DIVISION.
       PROGRAM-ID. CARREGAR-FICHEIRO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
       
        SELECT FICHEIRO ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/project/ficheiro.txt"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS WS-FICHEIRO-ID
               FILE STATUS IS WS-FICHEIRO-STATUS.

       DATA DIVISION.

       FILE SECTION.
           FD FICHEIRO.
           01 WS-FICHEIRO-REG.
               05 WS-FICHEIRO-ID PIC 9(02).
               05 WS-FICHEIRO-NOME PIC X(20).

       WORKING-STORAGE SECTION.
           01 WS-REGISTO-LOCAL.
               05 WS-ID PIC 9(02).
               05 WS-NOME PIC X(20).

           01 WS-FICHEIRO-STATUS PIC XX.
               88 WS-FICHEIRO-OK VALUE '00'.
               88 WS-FICHEIRO-NOVO VALUE '35'.

           01 WS-EXIT-VAR PIC X(02) VALUE 'N'.
               88 WS-EXIT-OK VALUE 'S'.

       PROCEDURE DIVISION.

           OPEN I-O FICHEIRO.

           IF WS-FICHEIRO-NOVO THEN 
               OPEN OUTPUT FICHEIRO
               DISPLAY "FICHEIRO CRIADO - NAO EXISTIA"
           END-IF. 

           IF WS-FICHEIRO-STATUS NOT = '00' THEN 
               DISPLAY "ERRO AO ABRIR"
               CLOSE FICHEIRO
               STOP RUN
           END-IF.

           PERFORM P400-LER-FICHEIRO.

           P400-LER-FICHEIRO.
               PERFORM UNTIL WS-EXIT-OK
                   READ FICHEIRO INTO WS-REGISTO-LOCAL
                       AT END 
                           SET WS-EXIT-OK TO TRUE
                       NOT AT END
                           DISPLAY 'NOME: ' WS-FICHEIRO-NOME
                   END-READ
               END-PERFORM.

           CLOSE FICHEIRO.
           STOP RUN.
