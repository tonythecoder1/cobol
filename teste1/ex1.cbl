       identification division.
       program-id. gestao_id. 

       environment division.
       input-output section.

       SELECT CONTACTOS ASSIGN TO 
           "/Users/antonyferreira/Documents/Cobol/contactos.dat"
               ORGANIZATION IS INDEXED
               ACCESS MODE IS RANDOM 
               RECORD KEY IS ID-CONTACTO
               FILE STATUS IS WS-FS.


