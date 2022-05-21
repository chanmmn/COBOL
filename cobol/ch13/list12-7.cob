000001 IDENTIFICATION DIVISION. 
000002 PROGRAM-ID. VNDNEW03. 
000003*------------------------------------------------
000004* Add a record to an indexed Vendor File.
000005*------------------------------------------------
000006 ENVIRONMENT DIVISION. 
000007 INPUT-OUTPUT SECTION. 
000008 FILE-CONTROL. 
000009 
000010*     COPY "SLVND01.CBL". 
000011*--------------------------------
000012* SLVND01.CBL
000013*--------------------------------
000014 SELECT VENDOR-FILE 
000015 ASSIGN TO "vendor" 
000016 ORGANIZATION IS INDEXED 
000017 RECORD KEY IS VENDOR-NUMBER 
000018 ACCESS MODE IS DYNAMIC. 
000019 
000020 
000021 DATA DIVISION. 
000022 FILE SECTION. 
000023 
000024*   COPY "FDVND02.CBL". 
000025*--------------------------------
000026* FDVND01.CBL
000027* Primary Key - VENDOR-NUMBER
000028* VENDOR-ADDRESS-2 not always used
000029* so may be SPACES
000030* VENDOR-PHONE is usually the
000031* number for VENDOR-CONTACT
000032* All fields should be entered in
000033* UPPER case.
000034*--------------------------------
000035 FD VENDOR-FILE 
000036 LABEL RECORDS ARE STANDARD. 
000037 01 VENDOR-RECORD. 
000038 	05 VENDOR-NUMBER PIC 9(5). 
000039 	05 VENDOR-NAME PIC X(30). 
000040 	05 VENDOR-ADDRESS-1 PIC X(30). 
000041 	05 VENDOR-ADDRESS-2 PIC X(30). 
000042 	05 VENDOR-CITY PIC X(20). 
000043 	05 VENDOR-STATE PIC X(2). 
000044 	05 VENDOR-ZIP PIC X(10). 
000045 	05 VENDOR-CONTACT PIC X(30). 
000046 	05 VENDOR-PHONE PIC X(15). 
000049 WORKING-STORAGE SECTION. 
000050 
000051 01 VENDOR-NUMBER-FIELD PIC Z(5). 
000052 
000053 PROCEDURE DIVISION. 
000054 PROGRAM-BEGIN.
          DISPLAY "Can Run". 
000055 OPEN I-O VENDOR-FILE. 
000056 PERFORM GET-NEW-VENDOR-NUMBER. 
000057 PERFORM ADD-RECORDS 
000057* VNDNEW03.CBL
000058 UNTIL VENDOR-NUMBER = ZEROES. 
000059 CLOSE VENDOR-FILE. 
000060 
000061 PROGRAM-DONE. 
000062 STOP RUN. 
000063
000064 GET-NEW-VENDOR-NUMBER. 
000065      PERFORM INIT-VENDOR-RECORD. 
000066      PERFORM ENTER-VENDOR-NUMBER. 
000067 
000068 INIT-VENDOR-RECORD. 
000069      MOVE SPACE TO VENDOR-RECORD. 
000070      MOVE ZEROES TO VENDOR-NUMBER. 
000071 
000072 ENTER-VENDOR-NUMBER. 
000073      DISPLAY "ENTER VENDOR NUMBER (1-99999)". 
000074      DISPLAY "ENTER 0 TO STOP ENTRY". 
000075      ACCEPT VENDOR-NUMBER-FIELD. 
000076*OR ACCEPT VENDOR-NUMBER-FIELD WITH CONVERSION.
000077 
000078      MOVE VENDOR-NUMBER-FIELD TO VENDOR-NUMBER. 
000079*OR MOVE WITH CONVERSION VENDOR-NUMBER-FIELD
000080* TO VENDOR-NUMBER.
000081 
000082 ADD-RECORDS. 
000083      PERFORM ENTER-REMAINING-FIELDS. 
000084      PERFORM WRITE-VENDOR-RECORD. 
000085      PERFORM GET-NEW-VENDOR-NUMBER. 
000086 
000087 WRITE-VENDOR-RECORD. 
000088 WRITE VENDOR-RECORD 
000089   INVALID KEY 
000090 DISPLAY "RECORD ALREADY ON FILE". 
000091 
000092 ENTER-REMAINING-FIELDS. 
000093 PERFORM ENTER-VENDOR-NAME. 
000094 PERFORM ENTER-VENDOR-ADDRESS-1. 
000095 PERFORM ENTER-VENDOR-ADDRESS-2. 
000096 PERFORM ENTER-VENDOR-CITY. 
000097 PERFORM ENTER-VENDOR-STATE. 
000098 PERFORM ENTER-VENDOR-ZIP. 
000099 PERFORM ENTER-VENDOR-CONTACT. 
000100 PERFORM ENTER-VENDOR-PHONE. 
000101 
000102 ENTER-VENDOR-NAME. 
000103 DISPLAY "ENTER VENDOR NAME". 
000104 ACCEPT VENDOR-NAME. 
000105 
000106 ENTER-VENDOR-ADDRESS-1. 
000107 DISPLAY "ENTER VENDOR ADDRESS-1". 
000108 ACCEPT VENDOR-ADDRESS-1. 
000109 
000110 ENTER-VENDOR-ADDRESS-2. 
000111 DISPLAY "ENTER VENDOR ADDRESS-2". 
000112 ACCEPT VENDOR-ADDRESS-2. 
000113 
000114 ENTER-VENDOR-CITY. 
000115 DISPLAY "ENTER VENDOR CITY". 
000116 ACCEPT VENDOR-CITY. 
000117 
000118 ENTER-VENDOR-STATE. 
000119 DISPLAY "ENTER VENDOR STATE". 
000120 ACCEPT VENDOR-STATE. 
000121 
000122 ENTER-VENDOR-ZIP. 
000123 DISPLAY "ENTER VENDOR ZIP". 
000124 ACCEPT VENDOR-ZIP. 
000125 
000126 ENTER-VENDOR-CONTACT. 
000127 DISPLAY "ENTER VENDOR CONTACT". 
000128 ACCEPT VENDOR-CONTACT. 
000129 
000130 ENTER-VENDOR-PHONE. 
000131 DISPLAY "ENTER VENDOR PHONE". 
000132 ACCEPT VENDOR-PHONE. 
000133 