       IDENTIFICATION DIVISION. 
       PROGRAM-ID. TESTE22.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.

       FILE-CONTROL.

       SELECT VOOSINPUT ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/project/voos.dat"
           ORGANIZATION IS INDEXED 
           ACCESS MODE IS DYNAMIC 
           RECORD KEY IS VOOSINPUT-ID
           FILE STATUS IS WS-FICHEIRO-STATUS-VOO.

       SELECT RESERVASINPUT ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/project/reservas.dat"
           ORGANIZATION IS INDEXED
           ACCESS MODE IS DYNAMIC
           RECORD KEY IS RESERVA-ID
           FILE STATUS IS WS-FICHEIRO-STATUS-RESERVA.

       DATA DIVISION.

       FILE SECTION.
           
           FD VOOSINPUT.
           01 VOOSINPUT-REG.
               05 VOOSINPUT-ID PIC 9(02).
               05 VOOSINPUT-NOME PIC X(10).
               05 LUGARESDISPONIVEIS-INPUT PIC 9(02).

           FD RESERVASINPUT.
           01 RESERVAINPUT-REG.
               05 RESERVA-ID PIC 9(02).
               05 RESERVA-NOME PIC X(10).
               05 RESERVA-VOO PIC X(10).


       WORKING-STORAGE SECTION.
           
           01 WS-FICHEIRO-STATUS-VOO PIC XX.
               88 WS-FICHEIRO-VOO-OK VALUE 00.

           01 WS-FICHEIRO-STATUS-RESERVA PIC XX.
               88 WS-RESERVA-STATUS-FILE VALUE 00.

           01 WS-REGISTO-VOOS-LOCAL PIC X(14).
               01 FILLER REDEFINES WS-REGISTO-VOOS-LOCAL.
               05 VOOS-ID PIC 9(02).
               05 VOOS-NOME PIC X(10).
               05 VOOS-LUGARES PIC X(02).


           77 WS-EXIT-OK PIC X(02) VALUE 'N'.
           77 WS-ID-ALTERA PIC 9(02) VALUE ZEROES.
           77 WS-NOME-ALTERA PIC X(10) VALUE SPACES.
           77 WS-OP PIC 9(02) VALUE ZEROES.
           77 WS-LUGARES PIC 9(02) VALUE ZEROES.
           77 WS-RESERVA-ID-PROVISORIA PIC 9(02) VALUE ZEROES.




       PROCEDURE DIVISION.

       PERFORM UNTIL WS-OP = 9

           DISPLAY "1 - Adicionar Voo"
           DISPLAY "2 - Visualizar Voos"
           DISPLAY "3 - Alterar Voo"
           DISPLAY "4 - Efetuar Reserva"
           DISPLAY "5 - Ver Reservas"
           DISPLAY "9 - SAIR"
           DISPLAY "Escolha uma opcao: "
           ACCEPT WS-OP

           EVALUATE WS-OP
               WHEN 1 
                   PERFORM P100-ADICIONAR-VOO
               WHEN 2 
                   PERFORM P200-VER-VOOS
               WHEN 3 
                   PERFORM P300-ALTERAR-VOOS
               WHEN 4
                   PERFORM P400-FAZER-RESERVA
               WHEN 5
                   PERFORM P500-VER-RESERVAS
               WHEN 9
                   DISPLAY "A SAIR DO SISTEMA..."
               WHEN OTHER 
                   DISPLAY "OPCAO INVALIDA"
           END-EVALUATE
       END-PERFORM.
       STOP RUN.
               


       P100-ADICIONAR-VOO.

           OPEN I-O VOOSINPUT.
           
           DISPLAY "ADICIONA O NUMERO DO VOO".
           ACCEPT VOOSINPUT-ID.
           DISPLAY "ADICIONA O NOME DO VOO".
           ACCEPT VOOSINPUT-NOME.
           DISPLAY "AIDICIONA LUGARES DISPONIVEIS"
           ACCEPT LUGARESDISPONIVEIS-INPUT.
           WRITE VOOSINPUT-REG.
           CLOSE VOOSINPUT.

       P200-VER-VOOS.

           OPEN I-O VOOSINPUT.
           
           PERFORM UNTIL WS-EXIT-OK = "S" OR  WS-EXIT-OK = "s"
               READ VOOSINPUT
                   AT END
                       DISPLAY "FICHEIRO CHEGOU AO FIM"
                       SET WS-EXIT-OK TO "S"
                   NOT AT END 
                       MOVE VOOSINPUT-ID TO VOOS-ID
                       MOVE VOOSINPUT-NOME TO VOOS-NOME
                       MOVE LUGARESDISPONIVEIS-INPUT TO VOOS-LUGARES
                       DISPLAY "VOO N - " VOOS-ID " NOME DE VOO "
                                VOOSINPUT-NOME " LUGARES DISPONIVEIS: "
                                                           VOOS-LUGARES 
                                                           " LUGARES"
               END-READ

           END-PERFORM.

           SET WS-EXIT-OK TO "N".

           CLOSE VOOSINPUT.

       P300-ALTERAR-VOOS.

           DISPLAY "Insere o ID a alterar".
           ACCEPT WS-ID-ALTERA.

           OPEN I-O VOOSINPUT.

           PERFORM UNTIL WS-EXIT-OK = "S" OR WS-EXIT-OK = "s"
               READ VOOSINPUT
                   AT END
                       DISPLAY "FICHEIRO CHEGOU AO FIM"
                       SET WS-EXIT-OK TO "S"
                   NOT AT END 
                       IF VOOSINPUT-ID = WS-ID-ALTERA
                           DISPLAY "ID ENCONTRADO - SIGA OS PASSOS "
                           DISPLAY "NOME ATUAL: " VOOSINPUT-NOME
                           DISPLAY "INSIRA UM NOVO NOME PARA O VOO"
                           ACCEPT WS-NOME-ALTERA
                           MOVE WS-NOME-ALTERA TO VOOSINPUT-NOME
                           REWRITE VOOSINPUT-REG
                           DISPLAY "REGISTO EFETUADO COM SUCESSO"
                       END-IF
                END-READ
           END-PERFORM.

           SET WS-EXIT-OK TO "N".

           CLOSE VOOSINPUT.

           P400-FAZER-RESERVA.

           OPEN I-O VOOSINPUT. 
           OPEN I-O RESERVASINPUT.    
     
           DISPLAY "DIGITE O VOO QUE DESEJA RESERVA UM LUGAR".
           ACCEPT WS-ID-ALTERA.

           
           PERFORM UNTIL WS-EXIT-OK = "S" OR WS-EXIT-OK = "s"
               READ VOOSINPUT
                   AT END 
                       DISPLAY "FICHEIRO CHEGOU AO FIM"
                   NOT AT END 
                       IF VOOSINPUT-ID = WS-ID-ALTERA
                           DISPLAY "VOO ENCONTRADO "
                           DISPLAY "LUGARES DISPONIVEIS: "
                                       LUGARESDISPONIVEIS-INPUT
                           MOVE LUGARESDISPONIVEIS-INPUT TO WS-LUGARES
                           
                           IF WS-LUGARES > 0
                               DISPLAY "INSIRA O NOME DO PASSAGEIRO"
                               ACCEPT RESERVA-NOME
                               MOVE VOOSINPUT-NOME TO RESERVA-VOO
                               COMPUTE WS-RESERVA-ID-PROVISORIA = 
                                       VOOS-ID + WS-LUGARES
                               MOVE 10 TO RESERVA-ID
                               WRITE RESERVAINPUT-REG
                               SUBTRACT 1 FROM LUGARESDISPONIVEIS-INPUT 
                               REWRITE VOOSINPUT-REG
                               DISPLAY "RESERVA FEITA COM SUCESSO"
                           ELSE 
                               DISPLAY "NAO HA LUGARES DISPONIVEIS"
                           END-IF
                       END-IF
               END-READ

           END-PERFORM.

           CLOSE VOOSINPUT.
           CLOSE RESERVASINPUT.

           P500-VER-RESERVAS.
           
           SET WS-EXIT-OK TO "N".
           OPEN I-O RESERVASINPUT.

           PERFORM UNTIL WS-EXIT-OK = "S"
               READ RESERVASINPUT
                   AT END 
                       DISPLAY "FICHEIRO CHEGOU AO FIM"
                   NOT AT END 
                       DISPLAY "RESERVA N: " RESERVA-ID 
                               " NOME DO PASSAGEIRO - " RESERVA-NOME 
                               " VOO - " RESERVA-VOO
               END-READ
           END-PERFORM. 
           CLOSE RESERVASINPUT.


       STOP RUN.
