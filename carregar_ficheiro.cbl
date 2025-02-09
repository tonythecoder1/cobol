       IDENTIFICATION DIVISION.
       PROGRAM-ID. AULA15.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.

           SELECT FICHEIRO ASSIGN TO 
           '/Users/antonyferreira/Documents/Cobol/fixe.txt'
           ORGANIZATION IS LINE SEQUENTIAL
           ACCESS MODE IS SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.

           FD FICHEIRO.
           01 LISTA-FICHEIRO.
              02 FICHEIRO-ID PIC X(10).
              02 FICHEIRO-NM PIC X(30).      

       WORKING-STORAGE SECTION.

           01 WS-FICHEIRO-NM PIC X(30).
           01 WS-FICHEIRO-ID PIC X(10).
           
       PROCEDURE DIVISION.

          
           OPEN EXTEND FICHEIRO.
           PERFORM P400-INICIO.

           
           CLOSE FICHEIRO.

       P400-INICIO.
           
           CLOSE FICHEIRO.
           OPEN EXTEND FICHEIRO.

           DISPLAY 'INSERE O NOME'.
           ACCEPT WS-FICHEIRO-NM.
           DISPLAY 'INSERE O CODIGO'.
           ACCEPT WS-FICHEIRO-ID.

           MOVE WS-FICHEIRO-NM TO FICHEIRO-NM
           MOVE WS-FICHEIRO-ID TO FICHEIRO-ID.
           WRITE LISTA-FICHEIRO.

        
           DISPLAY 'Gravação realizada com sucesso!'.

       P400-FIM.
