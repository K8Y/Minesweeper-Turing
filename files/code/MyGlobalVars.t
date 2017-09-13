%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Programmer: Kaitlyn Lee
%Program Name: minesweeper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% Main program variables
var YesToInstructions : string (1)
const minDimension : int := 1
const maxDimension : int := 20

%Introduction Window
var isIntroWindowOpen : boolean % Flag for Introduction Window state open or closed
var isFontWindowOpen : boolean
var hitMine : boolean := false

proc setInitialGameValues

    isIntroWindowOpen := false
    isFontWindowOpen := false
    hitMine := false

end setInitialGameValues

%Grid variables
var grid : array minDimension .. maxDimension, minDimension .. maxDimension of int %the gird that 'covers' everything, clicked to be 'uncovered'
var pixSize : int := 20
var startx : int := 30
var starty : int := 200
var cursorx, cursory, button, btnUpDown : int


proc setInitialGridValues
    for i : minDimension .. upper (grid, 1) %draws the grid the first time
        for j : minDimension .. upper (grid, 2)
            grid (i, j) := 0
        end for
    end for
end setInitialGridValues

%GenerateMines variables
var mines : array minDimension .. upper (grid, 1), minDimension .. upper (grid, 2) of boolean
%the positions of the mines - same dimensions as grid array
var numberOfMines : int

proc setInitalMineArray
    for i : minDimension .. upper (mines, 1) %resets array so it can then be newly generated
        for j : minDimension .. upper (mines, 2)
            mines (i, j) := false
        end for
    end for
    
    numberOfMines := 0
end setInitalMineArray

%CheckForMines variables
var mineCount : array minDimension .. upper (grid, 1), minDimension .. upper (grid, 2) of int

proc setInitialMineCount
    for i : minDimension .. upper (grid, 1) 
        for j : minDimension .. upper (grid, 2)
            mineCount (i, j) := 0
        end for
    end for
end setInitialMineCount
