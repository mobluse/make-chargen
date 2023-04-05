10 INPUT "IN BASE,OUT BASE,NUMBER";I,O,I$
20 REM BASECONV V1.1 IS FREE OPEN SOURCE SOFTWARE
30 REM FOSS LICENSE: GPLV3
40 REM COPYRIGHT (C) BY MIKAEL BONNIER, LUND, SWEDEN
50 DEF FN FPART(X)=X-INT(X)
60 L=-10+ASC("A")
70 PRINT "BASES:
80 PRINT " IN I=";I
90 PRINT " OUT O=";O
100 FOR J=1 TO LEN(I$):GOSUB 230:L1%(J)=V:NEXT J
110 A=0
120 FOR J=1 TO LEN(I$)
130 A=I*A+L1%(J)
140 NEXT J
150 D2=-INT(-LOG(A)/LOG(O))
160 FOR J=D2 TO 1 STEP -1
170 L2%(J)=INT(O*FN FPART(A/O)+.5)
180 A=INT(A/O)
190 NEXT J
200 FOR J=1 TO D2:GOSUB 280:O$=O$+C$:NEXT J
210 PRINT O$
220 END
230 REM DIGIT TO META DIGIT
240 C$=MID$(I$,J,1)
250 IF "0"<=C$ AND C$<="9" THEN V=VAL(C$):RETURN
260 IF "A"<=C$ AND C$<="Z" THEN V=ASC(C$)-L:RETURN
270 STOP
280 REM META DIGIT TO DIGIT
290 V=L2%(J)
300 IF 0<=V AND V<=9 THEN C$=MID$(STR$(V),2):RETURN
310 IF 10<=V AND V<=35 THEN C$=CHR$(V+L):RETURN
320 STOP
