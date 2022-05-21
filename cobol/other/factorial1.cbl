       IDENTIFICATION DIVISION.
       Program-Id. factorial recursive.
       ENVIRONMENT DIVISION.
       DATA DIVISION.
       Working-Storage Section.
       01 numb pic 9(4) value 5.
       01 fact pic 9(8) value 0.
       Local-Storage Section.
       01 num pic 9(4).
       PROCEDURE DIVISION.
       move numb to num.
       if numb = 0
       move 1 to fact
       else
       subtract 1 from numb
       call 'factorial'
       multiply num by fact
       end-if.
       display num '! = ' fact.
       goback.
       End Program factorial.