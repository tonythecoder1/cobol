       IDENTIFICATION DIVISION.
       PROGRAM-ID. ALTC.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CONTACTOS ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/contactos.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM
               RECORD KEY IS ID-CONTACTO
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

           OPEN I-O CONTACTOS

           IF NOT FS-OK
               DISPLAY 'Erro ao abrir o ficheiro.' 
               STOP RUN
               CLOSE CONTACTOS
           END-IF.
           
           DISPLAY '*** ALTERAR CONTACTOS ***'.

           PERFORM P300-ALTERAR THRU P300-FIM UNTIL EXIT-YES.

           CLOSE CONTACTOS.
           STOP RUN.

       P300-ALTERAR.
       
           OPEN I-O CONTACTOS

               DISPLAY 'INSIRA O ID PARA FAZER A PESQUISA'
               ACCEPT ID-CONTACTO

           READ CONTACTOS INTO WS-REGISTRO
               KEY IS ID-CONTACTO
                 INVALID KEY 
                   DISPLAY 'NAO EXISTE'
                   DISPLAY ' '
                 NOT INVALID KEY
                   DISPLAY '*** CONTACTO ENCONTRADO ***'
                   DISPLAY '*** ' ID-CONTACTO '-' NM-CONTACTO 
                   DISPLAY 'INSIRA O NOME ATUALIZADO'
                   ACCEPT NM-CONTACTO
                   REWRITE REG-CONTACTOS
                   DISPLAY 'CONTACTO ATUALIZADO'
           END-READ

           DISPLAY 'DIGITE S PARA CONTINUAR OU N PARA SAIR'.
           ACCEPT WS-EXIT.

           IF WS-EXIT = 's'
               PERFORM P300-ALTERAR
           ELSE
               SET EXIT-YES TO TRUE
               CLOSE CONTACTOS
           END-IF.

       P300-FIM.
           STOP RUN.
           
       P400-LER-FICHEIRO.
           CLOSE CONTACTOS.
           OPEN INPUT CONTACTOS.