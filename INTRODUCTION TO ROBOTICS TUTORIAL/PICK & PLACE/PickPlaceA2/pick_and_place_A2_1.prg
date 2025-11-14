Integer Tokens
Integer Blocks
Integer TokenRow
Integer TokenCol
Integer BlockRow
Integer BlockCol
Double TokenHeight
Double BlockHeight

Function main
	
	Motor On
	Power High
	Speed 30
	Accel 30, 30
	SpeedS 1300
	AccelS 5000
	Tool 1

	Tokens = 3
	
	Blocks = 3
	TokenHeight = 6.0
	BlockHeight = 6.0

	' Define un solo Local base para ambos pallets
	' Pallet 1: Tokens ก๗ 1 fila กั 2 columnas
	' Pallet 2: Blocks ก๗ 1 fila กั 2 columnas desplazadas en Y
	Pallet 1, Local_Token_Base, P20, P21, 2, 3
	Pallet 2, Local_Infeed, P22, P23, 1, 2


	Integer TokenID
	Integer BlockID

	Go Retract_Safe

	For TokenID = Tokens To 1 Step -1
		Pick_Infeed_Token()
		Alignment_Token()

		TokenRow = 1
		TokenCol = TokenID
		Place_Tray_Token
	Next TokenID

	For BlockID = Blocks To 1 Step -1
		Pick_Infeed_Block()
		Alignment_Block()

		BlockRow = 2
		BlockCol = BlockID
		Place_Tray_Block
	Next BlockID

	Go Retract_Safe
Fend

Function Pick_Infeed_Token
	Print "Picking Token from Infeed. Token ID = ", Tokens
	Go Pallet(2, 1, 1) +Z(50 + (Blocks * BlockHeight)) CP
	Move Pallet(2, 1, 1) +Z(Tokens * TokenHeight)
	On 8
	Wait .5
	Move Pallet(2, 1, 1) +X(-1) +Z(50 + (Tokens * TokenHeight)) CP
Fend

Function Pick_Infeed_Block
	Print "Picking Block from Infeed. Block ID = ", Blocks
	Go Pallet(2, 1, 2) +Z(50 + (Blocks * BlockHeight)) CP
	Move Pallet(2, 1, 2) +Z(Blocks * BlockHeight)
	On 8
	Wait .5
	Move Pallet(2, 1, 2) +X(-1) +Y(1) +Z(50 + (Blocks * BlockHeight)) CP
Fend

Function Alignment_Token
	Print "Aligning Token. Token ID = ", Tokens
	Go Align_Token +Z(20) CP
	Move Align_Token CP
	Off 8
	Move Align_Token CP
	On 10
	Move Align_Token +Z(5) CP
	Off 10
	Go Align_Token CP
	Move Align_Token
	On 8
	Wait .5
	Move Align_Token +Z(20) CP
Fend

Function Alignment_Block
	Print "Aligning Block. Block ID = ", Blocks
	Go Align_Block +Z(20) CP
	Move Align_Block CP
	Off 8
	Move Align_Block CP
	On 10
	Move Align_Block +Z(5) CP
    Off 10
	Move Align_Block CP
	Go Align_Block CP
	Move Align_Block
	On 8
	Wait .5
	Move Align_Block +Z(20) CP
Fend

Function Place_Tray_Token
	Print "Placing Token in Tray at Pallet"
	Go Pallet(1, TokenRow, TokenCol) -Z(100) CP
	Move Pallet(1, TokenRow, TokenCol)
	Off 8
	Wait .5
	Move Pallet(1, TokenRow, TokenCol) -Z(50) CP
	Tokens = Tokens - 1
Fend

Function Place_Tray_Block
	Print "Placing Block in Tray at Pallet(2)"
	Go Pallet(1, BlockRow, BlockCol) -Z(20) CP
	Move Pallet(1, BlockRow, BlockCol)
	Off 8
	Wait .5
	Move Pallet(1, BlockRow, BlockCol) -Z(50) CP
	Blocks = Blocks - 1
Fend
