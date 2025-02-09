       IDENTIFICATION DIVISION.
       PROGRAM-ID. CARREGAR-FICHEIRO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.
           SELECT FICHEIRO ASSIGN TO 
               "/Users/antonyferreira/Documents/Cobol/project/dados.txt"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
               RECORD KEY IS WS-FICHEIRO-ID
               FILE STATUS IS WS-FICHEIRO-STATUS.

       DATA DIVISION.

       FILE SECTION.

       FD FICHEIRO.
       01 WS-FICHEIRO-REG.
           05 WS-FICHEIRO-ID PIC 9(02).
           05 WS-FICHEIRO-NOME PIC X(20).

       WORKING-STORAGE SECTION.

       01 WS-FICHEIRO-STATUS PIC XX.
           88 WS-FICHEIRO-OK VALUE '00'.
           88 WS-FICHEIRO-NOVO VALUE '35'.

       01 WS-EXIT-VAR PIC X(02) VALUE 'N'.
           88 WS-EXIT-OK VALUE 'S'.

       PROCEDURE DIVISION.

 
           OPEN OUTPUT FICHEIRO.


           MOVE 1 TO WS-FICHEIRO-ID
           MOVE 'João' TO WS-FICHEIRO-NOME
           WRITE WS-FICHEIRO-REG.

           MOVE 2 TO WS-FICHEIRO-ID
           MOVE 'Maria' TO WS-FICHEIRO-NOME
           WRITE WS-FICHEIRO-REG.

           MOVE 3 TO WS-FICHEIRO-ID
           MOVE 'Pedro' TO WS-FICHEIRO-NOME
           WRITE WS-FICHEIRO-REG.


           CLOSE FICHEIRO.

 
           OPEN INPUT FICHEIRO.


           IF WS-FICHEIRO-STATUS NOT = '00' THEN
               DISPLAY "ERRO AO ABRIR FICHEIRO"
               STOP RUN
           END-IF.


           PERFORM P400-LER-FICHEIRO.

           CLOSE FICHEIRO.
           STOP RUN.

       P400-LER-FICHEIRO.
           PERFORM UNTIL WS-EXIT-OK
               READ FICHEIRO INTO WS-FICHEIRO-REG
                   AT END
                       SET WS-EXIT-OK TO TRUE
                   NOT AT END
                       DISPLAY "ID: " WS-FICHEIRO-ID
                       DISPLAY "NOME: " WS-FICHEIRO-NOME
               END-READ
           END-PERFORM.
