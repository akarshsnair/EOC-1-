(KEYBOARD)
    @SCREEN
    D = A
    @3840
    D = D + A
    @address
    M = D         //address = SCREEN + 3840

    @16
    D = A
    @length
    M = D         //length = 16

    @column
    M = 0        //column = 0

    @8192
    D = A
    @nill
    M = D        //nill= 8192

    @KBD
    D = M
    @MID
    D; JNE       //if KBD != 0 , go to MID

    @RESET
    0; JMP       //goto RESET

(MID)            // To draw rectangle at middle
    @address
    A = M
    M = -1        //RAM[address]= -1

    @length
    MD = M - 1   //length = length - 1
    @UPDATE
    D; JEQ      //if length = 0 ,goto UPDATE

    @32
    D = A
    @address
    M = M + D      // address =address +32

    @MID
    0; JMP

(UPDATE)
    @column
    M = M + 1     //column= column + 1

    @32
    D = A
    @column
    D = D - M
    @RECT1
    D; JEQ       //if column = 32 ,go to RECT1

    @column
    D = M
    @SCREEN
    D = D + A
    @3840
    D = D + A
    @address
    M = D        //address = column + SCREEN + 3840

    @16
    D = A
    @length
    M = D       // length=16

    @MID
    0; JMP

(RECT1)            //To draw rectangle at top left corner
    @SCREEN
    D = A
    @address
    M = D          //address = SCREEN

    @60
    D = A
    @length
    M = D        // length = 60

    @column
    M = 0

(LOOP1)
    @address
    A = M
    M = -1     //RAM[address]=-1

    @length
    MD = M - 1
    @UPLOOP1
    D; JEQ    //if length = 0 , goto UPLOOP

    @32
    D = A
    @address
    M = M + D    //address=address + 32

    @LOOP1
    0; JMP

(UPLOOP1)
    @column
    M = M + 1     //column = column + 1

    @8
    D = A
    @column
    D = D - M
    @RECT2
    D; JEQ       //if column = 8 , goto RECT2

    @column
    D = M
    @SCREEN
    D = D + A
    @address
    M = D      //address= SCREEN + column

    @60
    D = A
    @length
    M = D      //length = 60

    @LOOP1
    0; JMP

(RECT2)            //To draw rectangle at bottom right corner
    @SCREEN
    D = A
    @6296
    D = D + A
    @address
    M = D          //address = SCREEN + 6296

    @60
    D = A
    @length
    M = D

    @column
    M = 0

(LOOP2)
    @address
    A = M
    M = -1         //RAM[address]= -1

    @length
    MD = M - 1
    @UPLOOP2
    D; JEQ      // if length = 0 , goto UPLOOP2

    @32
    D = A
    @address
    M = M + D    //address= address + 32

    @LOOP2
    0; JMP

(UPLOOP2)
    @column
    M = M + 1     //column = column + 1

    @8
    D = A
    @column
    D = D - M
    @KEYBOARD
    D; JEQ      //if column = 8 , goto KEYBOARD

    @column
    D = M
    @SCREEN
    D = D + A
    @6296
    D = D + A
    @address
    M = D      //address= SCREEN + column + 6296

    @60
    D = A
    @length
    M = D     //length = 60

    @LOOP2
    0; JMP

(RESET)
    @SCREEN
    D = A
    @address
    M = D	   //address = SCREEN

(BLANK)
    @address
    A = M
    M = 0      //RAM[address] = 0

    @address
    M = M + 1  	//address= address + 1

    @nill
    MD = M - 1   //nill = nill - 1
    @BLANK
    D; JGT       //if nill > 0 , goto BLANK

    @KEYBOARD
    0; JMP
