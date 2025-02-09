identification division.
program-id. hello.
data division.
file section.
working-storage section.

77 WS-N1       pic 9(02) value 0.
77 WS-N2       pic 9(02) value 0.
77 WS-N3       pic 9(02) value 0.
77 WS-VM       pic Z(02) value 0.

procedure division.

main-procedure.

       DISPLAY "Insira o primeiro numero para somar"
       ACCEPT WS-N1.
       DISPLAY "Insira o segundo numero para somar"
       ACCEPT WS-N2.
       COMPUTE WS-N3 = WS-N1+WS-N2.
       DISPLAY "O resultado da soma é " WS-N3.

STOP RUN.
end program hello.