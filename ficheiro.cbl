       IDENTIFICATION DIVISION.
       PROGRAM-ID. FICHEIRO.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT REGISTO ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/lista.txt"
               ORGANIZATION IS LINE SEQUENTIAL
               ACCESS MODE IS SEQUENTIAL
               FILE STATUS IS WS-FS.

       DATA DIVISION.
       FILE SECTION.

       FD REGISTO.
           01 REG-FICHEIRO.
               02 REG-F-ID PIC 9(05).
               02 REG-F-NM PIC X(20). 

       WORKING-STORAGE SECTION.

           01 REG-VARI-LOCAIS PIC X(25) VALUE SPACES.

           01 FILLER REDEFINES REG-VARI-LOCAIS.
               03 REG-LOC-ID PIC 9(05).
               03 REG-LOC-NM PIC X(20).


           01 WS-FS PIC XX.
               88 FS-OK VALUE '00'.
           77 WS-EOF PIC X VALUE 'n'.                                  
               88 EOF-OK VALUE 's' FALSE 'n'.
           01 WS-EXIT PIC X VALUE 'n'.
               88 EXIT-YES VALUE 's' FALSE 'n'.

           77 WS-OP-EVAL PIC 9(02) VALUE ZERO.
           77 WS-VERIFICA-FIC PIC X(05) VALUE ZEROES.

       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

       OPEN EXTEND REGISTO.

       IF NOT FS-OK THEN 
           DISPLAY 'ERRO AO ABRIR O FICHEIRO'
           CLOSE REGISTO
           STOP RUN
       END-IF.

       DISPLAY '*** PROGRAMA PARA REGISTAR UTILIZADORES ***'.
       DISPLAY '*******************************************'.
       DISPLAY '*** 1 - Registar | 2- Carregar Ficheiro ***'.
       ACCEPT WS-OP-EVAL.

       EVALUATE WS-OP-EVAL
           WHEN 1 
               PERFORM P300-INICIO THRU P300-FIM UNTIL EXIT-YES
           WHEN 2
               PERFORM P400-LER-INICIO THRU P400-LER-FIM
       END-EVALUATE.


       CLOSE REGISTO.
       STOP RUN.

       P300-INICIO.

           DISPLAY '*** INTRODUZA OS DADOS SEGUINTES: ***'.
           DISPLAY 'INTRODUZA O NOME DO UTILIZADOR: '
           ACCEPT REG-LOC-NM.
           DISPLAY 'INTRODUZA O CODIGO DE UTILIZADOR: '
           ACCEPT REG-LOC-ID.

           MOVE REG-LOC-NM TO REG-F-NM.
           MOVE REG-LOC-ID TO REG-F-ID.
           WRITE REG-FICHEIRO.

           DISPLAY 'CONCTACTO REGISTADO COM SUCESSO'.
           DISPLAY ''.
           DISPLAY 'S-SAIR | A - ADICIONAR NOVO CONTACTO'.
           ACCEPT WS-EXIT.

           P300-FIM.

           IF WS-EXIT = 's' OR WS-EXIT = 'S' THEN
               SET EXIT-YES TO TRUE
           END-IF.

           P400-LER-INICIO.
           
           CLOSE REGISTO.
           OPEN INPUT REGISTO.

           IF NOT FS-OK THEN
               DISPLAY 'ERRO NO FICHERO'
               CLOSE REGISTO
               STOP RUN
           END-IF.

           DISPLAY '*** LER CONTACTOS EXISTENTES NA LISTA ***'
           DISPLAY ''.
           PERFORM UNTIL EOF-OK 
               READ REGISTO
               AT END SET EOF-OK TO TRUE
               NOT AT END 
                   DISPLAY 'Nome: ' REG-F-NM 'ID: ' REG-F-ID
               END-READ
           END-PERFORM.
           CLOSE REGISTO.

           DISPLAY ''.
           DISPLAY 'Leitura terminada'.
           
           P400-LER-FIM.
               CLOSE REGISTO.
               STOP RUN.

       END PROGRAM FICHEIRO.


       