       IDENTIFICATION DIVISION.
       PROGRAM-ID. LERINDEX.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT CONTACTOS ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/contactos.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS SEQUENTIAL
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

           77 WS-CONT-ID PIC 9(03) VALUE ZEROES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

           SET WS-CONT-ID TO ZEROES.
           OPEN INPUT CONTACTOS

           IF NOT FS-OK
               DISPLAY 'Erro ao abrir o ficheiro. Código de status: ' 
                        WS-FS
               STOP RUN
           END-IF.
           
           DISPLAY '*******************************'.
           DISPLAY ' '.
           DISPLAY '*** CODIGO DE ABERTURA DO FICHEIRO - ' WS-FS.
           DISPLAY ' '.
           DISPLAY '*** LISTA DE CONTACTOS ***'.
           DISPLAY ' '

           PERFORM P300-LISTAR THRU P300-FIM.

           CLOSE CONTACTOS.
           STOP RUN.

       P300-LISTAR.

           SET EOF-OK TO FALSE
           SET WS-CONT-ID TO 0
           
           PERFORM UNTIL EOF-OK
               READ CONTACTOS INTO WS-REGISTRO
                   AT END 
                       SET EOF-OK TO TRUE 
                   NOT AT END 
                       ADD 1 TO WS-CONT-ID
                       DISPLAY 'ID: ' ID-CONTACTO 
                               ' NOME: ' NM-CONTACTO
                END-READ               
           END-PERFORM
           CLOSE CONTACTOS         

           DISPLAY ' '
           DISPLAY '*** NUMERO DE REGISTOS: ' WS-CONT-ID
           DISPLAY ' '
           STOP RUN.
           

       P300-FIM.
           STOP RUN.

       END PROGRAM LERINDEX.
           