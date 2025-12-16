Integer Tokens
Integer Blocks
Integer TokenRow
Integer TokenCol
Integer BlockRow
Integer BlockCol
Real TokenHeight
Real BlockHeight
Real tElapsed   ' variable para tiempo

Function main

    Motor On
    Power High
    Speed 30
    Accel 30, 30
    SpeedS 1300
    AccelS 5000
    Tool 0

    Tokens = 1
    Blocks = 3
    TokenHeight = 6.0
    BlockHeight = 6.0

    Pallet 1, Local_Tray_Base, P20, P21, 2, 3
    Pallet 2, Local_Infeed, P23, P22, 1, 2

    Integer TokenID
    Integer BlockID

    Go Retract_Safe

    ' --- INICIO MEDICIÓN ---
    TmReset 0   ' Reinicia el timer #0

    For TokenID = Tokens To 1 Step -1
        Pick_Terere()
        Infeed_Tereree
        Place_Terere
    Next TokenID

    ' --- FIN MEDICIÓN ---
    tElapsed = Tmr(0)   ' Tiempo transcurrido en segundos
    Print "Tiempo total de ejecución = " + Str$(tElapsed) + " seconds"

    
Fend


Function Pick_Terere
	Print "Picking Terere"
	Go Pick_Place_Terer -X(60)
	On 11
	Move Pick_Place_Terer
	Off 11
	Wait .5
	Move Pick_Place_Terer +Z(5) CP
	Move Pick_Place_Terer -X(60) +Z(5) CP
	Move Pick_Place_Terer -X(60) +Z(50) CP
Fend

Function Infeed_Tereree
	Print "Serving Terere"
	Go Infeed_Terere -Y(60) +Z(5) CP
	Move Infeed_Terere +Z(5) CP
	Move Infeed_Terere CP
	On 11
	Move Infeed_Terere CP
	Move Infeed_Terere -Y(60) CP
	Off 11
	Move Infeed_Terere -Y(100) +Z(200)
	 
    Go Infeed_Water -Y(160) +Z(60) CP
    Move Infeed_Water +Z(60) CP
    Move Infeed_Water CP ' Ir al punto P1
    Wait .5
    Move Infeed_Water +Z(60) CP ' Ir al punto P2
    Move Infeed_Water CP ' Ir al punto P1
    Wait .5
    Move Infeed_Water +Z(60) CP ' Ir al punto P2



    Move Infeed_Water +Z(60) -Y(160)
	Go Infeed_Terere -Y(100) +Z(200)
	Move Infeed_Terere +Z(5) -Y(60) CP
    On 11
	Move Infeed_Terere CP
	Wait .5
	Off 11
	Move Infeed_Terere +Z(5) CP
	Move Infeed_Terere +Z(5) -Y(60) CP
	Move Infeed_Terere -Y(60) +Z(30) CP
Fend

Function Place_Terere
	Print "Placing Terere Ricura"
	Go Pick_Place_Terer -X(60) +Z(80) CP
	Go Pick_Place_Terer -X(60) +Z(5) CP
	Move Pick_Place_Terer +Z(5) CP
	Move Pick_Place_Terer CP
	On 11
	Wait .5
	Move Pick_Place_Terer -X(60) CP
	Off 11
	Move Pick_Place_Terer -X(60) CP
Fend

Function Place_Tray_Token
	Print "Placing Token in Tray at Pallet"
	Go Pallet(1, TokenRow, TokenCol) +Z(100) CP
	Move Pallet(1, TokenRow, TokenCol) +Z(5)
	Off 8
	Wait .5
	Move Pallet(1, TokenRow, TokenCol) +Z(50) CP
	Tokens = Tokens - 1
Fend

Function Place_Tray_Block
	Print "Placing Block in Tray at Pallet(2)"
	Go Pallet(1, BlockRow, BlockCol) +Z(100) CP
	Move Pallet(1, BlockRow, BlockCol) +Z(5)
	Off 8
	Wait .5
	Move Pallet(1, BlockRow, BlockCol) +Z(50) CP
	Blocks = Blocks - 1
Fend

