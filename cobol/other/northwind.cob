000100 IDENTIFICATION DIVISION.
000200 PROGRAM-ID. HELLO.
000300
000400 ENVIRONMENT DIVISION.
000500    INPUT-OUTPUT SECTION.
000600       FILE-CONTROL.
000700       SELECT STUDENT ASSIGN TO 'nw.txt'
000800       ORGANIZATION IS LINE SEQUENTIAL.            
000900
000100 DATA DIVISION.
000101    FILE SECTION.
000120    FD STUDENT.
000130    01 STUDENT-FILE.
000140      05 STUDENT-ID PIC X(11).
000150      05 NAME PIC X(40).
000160
000170    WORKING-STORAGE SECTION.
000180    01 WS-STUDENT.
000190       05 WS-STUDENT-ID PIC 9(5).
000200       05 WS-NAME PIC A(25).
000210    01 WS-EOF PIC A(1). 
000220
000230 PROCEDURE DIVISION.
000240   OPEN INPUT STUDENT.
000250      PERFORM UNTIL WS-EOF='Y'
000260         READ STUDENT INTO WS-STUDENT
000270            AT END MOVE 'Y' TO WS-EOF
000280            NOT AT END DISPLAY WS-STUDENT
000290         END-READ
000300      END-PERFORM.
000310   CLOSE STUDENT.
000320 STOP RUN.