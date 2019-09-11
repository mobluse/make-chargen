001 REM SHOW REVERSE PETSCII TABLE SHIFTED & UNSHIFTED ON X16
010 GOTO 370
020 REM MODULO
030 MOD%=INT((X/Y-INT(X/Y))*Y+.5):RETURN
040 REM PRINT HEADING AND CHARACTER
050 X=I:Y=16:GOSUB 30
060 IF MOD%<>0 THEN GOTO 90
070 IF I<>$20 THEN PRINT:PRINT "  ";V$;
080 PRINT:PRINT CHR$(I/16+N);"0";V$;
090 IF I=$22 THEN PRINT CHR$(18);CHR$(I);CHR$(I);CHR$(157);CHR$(146);" ":GOTO 100
095 PRINT CHR$(I);" ";
100 RETURN
110 REM DELAY
120 T1=TIME
130 D=60*D/1000
140 IF TIME-T1<D THEN GOTO 140
150 RETURN
160 REM WAIT 1 S AND CURSOR HOME
170 D=1000:GOSUB 120
180 PRINT CHR$(19)
190 RETURN
200 REM PRINT TABLE
210 N=ASC("0")
220 B$=CHR$($C0):V$=CHR$($DD)
230 PRINT:PRINT:PRINT:PRINT "  ";V$;
240 FOR I=ASC("0") TO ASC("9"):PRINT CHR$(I);" ";:NEXT
250 FOR I=ASC("A") TO ASC("F"):PRINT CHR$(I);" ";:NEXT
260 PRINT:PRINT B$;B$;CHR$($DB);:FOR I=1 TO 31:PRINT B$;:NEXT
270 FOR I=$20 TO $7F
280 GOSUB 50
290 NEXT
300 N=ASC("7")
310 FOR I=$A0 TO $FF
320 GOSUB 50
330 NEXT
340 PRINT CHR$(19)
350 RETURN
360 REM MAIN
370 IF PEEK($D9)<>40 THEN SYS$FF5F
375 PRINT CHR$(147)
380 GOSUB 210
385 REM LOOP
390 PRINT CHR$(14):PRINT "PETSCII (SHIFTED)  "
400 GOSUB 170
410 PRINT CHR$(142):PRINT "PETSCII (UNSHIFTED)"
420 GOSUB 170
430 GOTO 390
RUN
 
