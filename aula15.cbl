       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA15.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CONTACTOS ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/contactos.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FS.


       DATA DIVISION.
       FILE SECTION.
       FD CONTACTOS.
       01 REG-CONTACTOS.
           03 ID-CONTACTO   PIC 9(02).
           03 NM-CONTACTO   PIC X(20).
           

       WORKING-STORAGE SECTION.

           01 WS-REGISTRO PIC X(22) VALUE SPACES.
           
           01 FILLER REDEFINES WS-REGISTRO.
               03 WS-ID-CONTACTO PIC 9(02).
               03 WS-NM-CONTACTO PIC X(20).
       
           
           01 WS-FS PIC XX.
               88 FS-OK VALUE '00'.
           77 WS-EOF PIC X VALUE 'N'.
               88 EOF-OK VALUE 'S' FALSE 'N'.
           01 WS-EXIT PIC X VALUE 'N'.
               88 EXIT-YES VALUE 'S' FALSE 'N'.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           OPEN EXTEND CONTACTOS
           IF NOT FS-OK
               DISPLAY 'Erro ao abrir o ficheiro.' 
               STOP RUN
               CLOSE CONTACTOS
           END-IF.
           
           DISPLAY '*** REGISTRO DE CONTACTOS ***'.

           PERFORM P300-REGISTO THRU P300-FIM UNTIL EXIT-YES.

           CLOSE CONTACTOS.
           STOP RUN.

       P300-REGISTO.

           DISPLAY 'INFORME AS INFORMAÇÕES PARA REGISTRO DE CONTACTOS'.
           DISPLAY 'INTRODUZA O NUMERO DO CONTACTO'.
           ACCEPT WS-ID-CONTACTO.
           DISPLAY 'INTRODUZA O NOME DO CONTACTO'.
           ACCEPT WS-NM-CONTACTO.

           MOVE WS-ID-CONTACTO TO ID-CONTACTO.
           MOVE WS-NM-CONTACTO TO NM-CONTACTO.

           WRITE REG-CONTACTOS.
           DISPLAY 'CONTACTO GRAVADO COM SUCESSO'.

           DISPLAY 'DIGITE S PARA CONTINUAR OU N PARA SAIR'.
           ACCEPT WS-EXIT.

           IF WS-EXIT = 's'
               PERFORM P300-REGISTO
           ELSE
               SET EXIT-YES TO TRUE
               CLOSE CONTACTOS
           END-IF.

       P300-FIM.
           STOP RUN.
           
