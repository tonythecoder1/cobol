       IDENTIFICATION DIVISION. 
       PROGRAM-ID. AULA14.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT STUDENT ASSIGN TO 
               '/Users/antonyferreira/Documents/Cobol/student.txt'
               ORGANIZATION IS SEQUENTIAL.      

       DATA DIVISION.
       FILE SECTION.
       FD STUDENT.
       01 STUDENT-FILE.
           03 CD-STUDENT PIC 9(05).
           03 NM-STUDENT PIC X(20).

       WORKING-STORAGE SECTION.
       77 WS-EOF PIC A VALUE 'N'.  
       01 WS-DADOS PIC X(25) VALUE SPACES.

       01 FILLER REDEFINES WS-DADOS.
           03 WS-CD-STUDENT PIC 9(05).
           03 WS-NM-STUDENT PIC X(20).

       PROCEDURE DIVISION.
       
           DISPLAY 'HELLO WORLD'.   
           OPEN INPUT STUDENT.

           PERFORM UNTIL WS-EOF = 'F'
               READ STUDENT INTO WS-DADOS
                   AT END 
                       MOVE 'F' TO WS-EOF
                   NOT AT END 
                       DISPLAY 'DADOS LIDOS: ' WS-DADOS
                       MOVE WS-DADOS TO STUDENT-FILE
                       DISPLAY WS-CD-STUDENT ' - ' WS-NM-STUDENT
               END-READ
           END-PERFORM.

           CLOSE STUDENT.                

           STOP RUN.

       END PROGRAM AULA14.
