       IDENTIFICATION DIVISION.
       PROGRAM-ID. CriarArquivo.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT Arquivo ASSIGN TO 'arquivo.txt'
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  Arquivo.
       01  RegistroArquivo PIC X(50).

       WORKING-STORAGE SECTION.
       01  FimPrograma PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       ABRE-ARQUIVO.
           OPEN OUTPUT Arquivo
           MOVE 'Olá, este é um arquivo de texto!' TO RegistroArquivo
           WRITE RegistroArquivo
           CLOSE Arquivo
           MOVE 'S' TO FimPrograma.

       PARTE-PRINCIPAL.
           PERFORM ABRE-ARQUIVO
           DISPLAY 'Arquivo criado com sucesso!'
           STOP RUN.
