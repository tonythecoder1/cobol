       IDENTIFICATION DIVISION.
       PROGRAM-ID. FileReadWrite.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT InputFile ASSIGN TO "input.txt"
               ORGANIZATION IS LINE SEQUENTIAL.
           SELECT OutputFile ASSIGN TO "output.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  InputFile.
       01  InputRecord PIC X(100).

       FD  OutputFile.
       01  OutputRecord PIC X(100).

       WORKING-STORAGE SECTION.
       01  UserInput PIC X(100).
       01  WS-Choice PIC 9.
       01  EOF-FLAG      PIC X VALUE 'N'.

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           DISPLAY "1 - Escrever no arquivo"
           DISPLAY "2 - Ler do arquivo"
           DISPLAY "Escolha uma opção: "
           ACCEPT WS-Choice

           IF WS-Choice = 1 THEN
               PERFORM P200-WRITE-TO-FILE
           ELSE IF WS-Choice = 2 THEN
               PERFORM P100-READ-FROM-FILE
           ELSE
               DISPLAY "Opção inválida."
           END-IF.

       P200-WRITE-TO-FILE.
           DISPLAY "Digite o texto para salvar no arquivo: ".
           ACCEPT UserInput
           OPEN OUTPUT OutputFile
           MOVE UserInput TO OutputRecord
           WRITE OutputRecord
           CLOSE OutputFile
           DISPLAY "Texto salvo em output.txt.".

       P100-READ-FROM-FILE.
           OPEN INPUT InputFile
           DISPLAY "Conteúdo do arquivo:"
           MOVE 'N' TO EOF-FLAG  *> Reset EOF flag
           PERFORM UNTIL EOF-FLAG = 'Y'
               READ InputFile INTO InputRecord
                   AT END
                       MOVE 'Y' TO EOF-FLAG
                   NOT AT END
                       DISPLAY InputRecord
               END-READ
           END-PERFORM
           CLOSE InputFile.

       END PROGRAM FileReadWrite.
