identification division.
program-id. tuturial2.
data division.
file section.
working-storage section.

       77 WS-N1   PIC 9(02) VALUE 0.
       77 WS-N2   PIC 9(02) VALUE 0.
       77 WS-TOTAL-INS PIC 9(01) VALUE 0.
       77 WS-STR  PIC X(30).

procedure division.


main-procedure.


       MOVE 'Ola hello oi xx ' TO WS-STR.
       INSPECT WS-STR REPLACING ALL "x" BY "G".
       display WS-STR.
       

       DISPLAY "O valor total de espaços é de " WS-TOTAL-INS.


stop run.
end program tuturial2.