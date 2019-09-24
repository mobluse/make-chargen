1 REM SHOW PETSCII TABLE SHIFTED & UNSHIFTED & ISO8859-15 ON X16
10 GOTO 370
20 REM MODULO
30 MOD%=INT((X/Y-INT(X/Y))*Y+.5):RETURN
40 REM PRINT HEADING AND CHARACTER
50 X=I:Y=16:GOSUB 30
60 IF MOD%<>0 THEN GOTO 90
70 IF I<>$20 THEN PRINT:PRINT "  ";V$;
80 PRINT:PRINT CHR$(I/16+N);"0";V$;
90 PRINT CHR$(I);" ";
100 RETURN
110 REM DELAY
120 T1=TIME
130 D=60*D/1000
140 IF TIME-T1<D THEN GOTO 140
150 RETURN
160 REM WAIT 1 S
170 D=1000:GOSUB 120
190 RETURN
200 REM PRINT TABLE
210 N=ASC("0")
230 PRINT:PRINT:PRINT "  ";V$;
240 FOR I=ASC("0") TO ASC("9"):PRINT CHR$(I);" ";:NEXT
250 FOR I=ASC("A") TO ASC("F"):PRINT CHR$(I);" ";:NEXT
260 PRINT:PRINT B$;B$;P$;:FOR I=1 TO 31:PRINT B$;:NEXT
270 FOR I=$20 TO $7F
280 GOSUB 50
290 NEXT
300 N=ASC("7")
310 FOR I=$A0 TO $FF
320 GOSUB 50
330 NEXT
350 RETURN
360 REM MAIN
370 IF PEEK($D9)<>40 THEN SYS$FF5F
380 PRINT CHR$($93);
385 REM LOOP
390 PRINT CHR$($13);CHR$($8F);CHR$($0E):PRINT "PETSCII      (SHIFTED)"
395 B$=CHR$($C0):V$=CHR$($DD):P$=CHR$($DB)
400 GOSUB 210
405 GOSUB 170
410 PRINT CHR$($13);CHR$($8F);CHR$($8E):PRINT "PETSCII    (UNSHIFTED)"
415 B$=CHR$($C0):V$=CHR$($DD):P$=CHR$($DB)
420 GOSUB 210
425 GOSUB 170
430 PRINT CHR$($13);CHR$($0F):PRINT "ISO8859-15   (SHIFTED)"
435 B$="-":V$=CHR$($7C):P$="+"
440 GOSUB 210
450 GOSUB 170
460 GOTO 390
