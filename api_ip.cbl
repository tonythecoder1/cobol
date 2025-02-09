       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA15.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
       
       SELECT REGISTO-LISTA-IP ASSIGN TO 
               "/Users/antonyferreira/Documents/Cobol/ip.txt"
               ORGANIZATION IS SEQUENTIAL 
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.
       
       FD REGISTO-LISTA-IP.
           01 LISTA-DEVOLVIDA PIC X(100).

       WORKING-STORAGE SECTION.
       
       77 WS-COMMAND PIC X(100) VALUE
           "'curl -s https://ipinfo.io/json -o ip.txt'.".

       01 WS-FS PIC XX.
           88 FS-OK VALUE '00'.

       01 WS-INFO PIC X(120) VALUE SPACES.
           01 FILLER REDEFINES WS-INFO.
           02 WS-CITY PIC X(20).
           02 WS-IP PIC X(100).

       PROCEDURE DIVISION.
       
       MAIN-PROCEDURE.
         
           PERFORM P300-INICIO THRU P300-FIM.

       P300-INICIO.
             
           CALL "system" USING WS-COMMAND.
           OPEN INPUT REGISTO-LISTA-IP.

           IF WS-FS = 00 THEN 
               DISPLAY 'FICHEIRO ABERTO COM SUCESSO - CODIGO ' WS-FS
           ELSE 
               DISPLAY 'ERRO DE FICHEIRO - CODIGO: ' WS-FS
           END-IF.

           READ REGISTO-LISTA-IP INTO WS-INFO.
           CLOSE REGISTO-LISTA-IP.

           DISPLAY "RESPOSTA: " WS-INFO.

       P300-FIM.
           STOP RUN.