10 GOTO 1010
100 POKE $7E,L:POKE $7F,H
110 POKE 780,$7E:POKE 781,B:POKE 782,0:SYS $FF74:REM FETCH
120 G=PEEK(780)
130 RETURN
1010 B=4:DIM K$(107),A$(107):REM MAY CHANGE FOR NEW ROM
1014 I=1
1020 BASE=$C0DE
1030 FOR P=BASE TO BASE+388:REM MAY CHANGE FOR NEW ROM
1035 H=INT(P/256):L=P-256*H
1040 GOSUB 100
1050 W$=W$+CHR$(G AND 127)
1060 IF G>127 THEN K$(I)=W$:W$="":I=I+1
1070 NEXT
1080 M=I-1
1100 FOR J=1 TO M
1104 N=2
1110 IF ASC(LEFT$(K$(J),1))=0 THEN K$(J)=MID$(K$(J),2)
1120 IF LEN(K$(J))<=N THEN A$(J)=K$(J):GOTO 1166
1130 A$(J)=LEFT$(K$(J),N)
1134 IF J=1 GOTO 1166
1140 FOR L=1 TO J-1
1150 IF LEFT$(K$(L),N)=A$(J) THEN N=N+1:A$(J)=LEFT$(K$(J),N):GOTO 1140
1160 NEXT
1166 IF LEN(K$(J))=LEN(A$(J)) THEN GOSUB 1310:GOTO 1180
1170 A$(J)=LEFT$(A$(J),LEN(A$(J))-1)+CHR$(ASC(MID$(A$(J),LEN(A$(J)),1))+32)
1180 PRINT MID$(STR$(10*J),2);" ";A$(J);":REM ";K$(J)
1190 NEXT
1200 END:REM FOR J=1 TO M:PRINT A$(J);"=";K$(J),:NEXT:END
1310 IF A$(J)="PRINT" THEN A$(J)="?"
1320 RETURN
