       IDENTIFICATION DIVISION.
       PROGRAM-ID. TESTE.

       ENVIRONMENT DIVISION.

       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

       SELECT FICHEIRO ASSIGN TO 
              "/Users/antonyferreira/Documents/Cobol/project/dados.txt"
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

       01 WS-REGISTO.
           05 WS-ID PIC 9(02).
           05 WS-NOME PIC X(20).

       01 WS-FICHEIRO-STATUS PIC X(02).
           88 FICHEIRO-OK VALUE '00'.
           88 FICHEIRO-STATUS VALUE '35'.

       01 WS-FIM-FICHEIRO PIC XX VALUE "N".
           88 WS-EXIT VALUE "S".


       PROCEDURE DIVISION.
       
       INICIO-PROGRAMA.
           PERFORM P300-GRAVAR-FICHEIRO.
           PERFORM P500-LER.
           STOP RUN.

       P300-GRAVAR-FICHEIRO.

           OPEN I-O FICHEIRO.

           IF NOT FICHEIRO-OK THEN
               DISPLAY "ERRO AO ABRIR O FICHEIRO"
               STOP RUN
           END-IF.

           IF WS-FICHEIRO-STATUS = "35" THEN
               DISPLAY "O FICHEIRO NA EXISTE - FOI CRIADO UM NOVO"
               CLOSE FICHEIRO
           OPEN OUTPUT FICHEIRO
           CLOSE FICHEIRO
           OPEN I-O FICHEIRO  
           END-IF.

           DISPLAY "PRENCHA O NOME".
           ACCEPT WS-NOME.
           MOVE WS-NOME TO WS-FICHEIRO-NOME.

           DISPLAY "PRENCHA O ID".
           ACCEPT WS-ID.
           MOVE WS-ID TO WS-FICHEIRO-ID.

           WRITE WS-FICHEIRO-REG
               INVALID KEY 
                   DISPLAY "Registo ja existe"
               NOT INVALID KEY 
                   DISPLAY "REGISTO EFETUADO COM SUCESSO"
           END-WRITE.

           PERFORM P500-LER.
       
       P300-FIM.

       P500-LER.

       PERFORM UNTIL WS-FIM-FICHEIRO = "S"
        READ FICHEIRO INTO WS-FICHEIRO-REG
            AT END 
                MOVE "S" TO WS-FIM-FICHEIRO  
           NOT AT END 
                DISPLAY 'NOME ' WS-FICHEIRO-NOME
        END-READ
       END-PERFORM.


