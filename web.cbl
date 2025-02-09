       IDENTIFICATION DIVISION.
       PROGRAM-ID. web.

       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT WeatherFile ASSIGN TO "weather_response.txt"
               ORGANIZATION IS LINE SEQUENTIAL.

       DATA DIVISION.
       FILE SECTION.
       FD  WeatherFile.
       01  WeatherRecord     PIC X(100).

       WORKING-STORAGE SECTION.
       01  City              PIC X(30).
       01  Temperature       PIC X(10).
       01  Command           PIC X(100).
       01  Wind              PIC X(100).

       77 WS-CIDADE PIC X(20).

       PROCEDURE DIVISION.
       MAIN-LOGIC.
           
           MOVE "curl wttr.in/Lisbon?format=3 > weather_response.txt" 
           TO Command.
           CALL "system" USING Command.

           OPEN INPUT WeatherFile.
           READ WeatherFile INTO WeatherRecord.
           CLOSE WeatherFile.
           DISPLAY "Resposta do curl: " WeatherRecord.

           UNSTRING WeatherRecord DELIMITED BY ' '
               INTO City Temperature Wind
           END-UNSTRING.

           DISPLAY "Cidade: " City.
           DISPLAY "Temperatura: " Temperature.
           DISPLAY "WIND " Wind.
           STOP RUN.

       END PROGRAM web.
