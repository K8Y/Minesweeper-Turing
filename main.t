%Programmer: Kaitlyn Lee
%%%%%%%%%%%%%%%%%%%%%%%%

include "files/code/includes.t"

setscreen ("graphics:1200;800")
Mouse.ButtonChoose ("multibutton")

loop
    cls
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % procedure to set all initial global variable with file scope
    % even if already set (located in MyGlobalVars.t)
    setInitialGameValues
    setInitialGridValues
    setInitalMineArray
    setInitialMineCount

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % A.      display title screen
    displayIntroWindow
    
    % B.      Ask user if they want instructions displayed on the screen
    put "Do you wish to see instructions?  (Y/N or y/n) " ..
    getch (YesToInstructions)

    if YesToInstructions = "y" or YesToInstructions = "Y" then
        colour (5)
        displayInstructionWindow   % The Instruction screen will display and pause the porgram
        colour (black)
    end if

    cls
    put "How many mines? " ..
    get numberOfMines
    cls

    generateMines (mines)
    checkForMines (mineCount) %sets array of numbers
    drawInitialGrid

    put "Number of mines: ", numberOfMines

    loop
        Mouse.ButtonWait ("down", cursorx, cursory, button, btnUpDown)
        isInside (cursorx, cursory, button, grid)
        drawGrid
        if hitMine = true or win = true then
            exit
        end if
    end loop

    if hitMine = true then
        locate (1, 1)
        put "You hit a mine! Game over..."
    elsif win = true then
        locate (1, 1)
        colour (purple)
        put "You found all the mines and won!!"
    end if
    
    displayMines

    var key : string (1)
    put "Play Again? (y/n) " ..
    getch (key)
    if key = "N" or key = "n" then
        put "\nGoodbye :)"
        exit
    end if

end loop



% C.      (main program)
% 1.      Draw covered board (50 x 50)
% 2.      User clicks square
%    a.      Program generates 15 mines and stores their positions in array mines
%   b.      The square that was clicked has to be an empty square (no number underneath)
% 3.      The square is uncovered and the surrounding squares are uncovered (goes out in all directions until it hits one with a number then it stops)
%    a.      When a square is about to be uncovered check all surrounding blocks if there is a mine. If so then every time there is a mine, add 1 to a counter. Store that number in the numbers array and display it on that square.
% 4.      User clicks square
%   a.      If it's a right click then change colour of square and go back to 4
%   b.      If it's a left click then move to next step
% 5.      Check all surrounding blocks if there is a mine.
%   a.       If so then uncover the square and every time there is a mine, add 1 to a counter. Store that number in the numbers array and display it on that square.
%   b.      If it is empty then uncover all surrounding blocks and keep doing so until all the connecting empty boxed are uncovered and the boxes touching them (with numbers) are uncovered.
%   c.      If it has a mine then end game and go to losing screen
% 6.      If all square are not uncovered (except mines) go back to step 4
%    a.      If all squares are uncovered (except mines) then game ends. Display winning screen
% i.      If user clicks "Play again" then start over from step 1
