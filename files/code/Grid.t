Mouse.ButtonChoose ("multibutton")

%button = 1 when left-click, 2 when middle-click, 3 when right-click
%btnUpDown = 1 when button is clicked and 0 when a button is released

%to check if mouse was clicked in the grid and which button was clicked (left or right?)
proc isInside (iCursorx, iCursory, iButton : int, var iArray : array minDimension .. *, minDimension .. * of int)
    for i : minDimension .. upper (iArray, 1)
	for j : minDimension .. upper (iArray, 2)
	    if iButton = 1 and %left-click
		    (iCursorx > (startx + j * pixSize + 1)) and (iCursorx < (startx + j * pixSize + pixSize - 1)) and (iCursory > (starty + i * pixSize + 1)) and (iCursory < (starty + i * pixSize +
		    pixSize - 1)) then
		iArray (i, j) := iButton
	    elsif iButton = 3 and     %right-click
		    (iCursorx > (startx + j * pixSize + 1)) and (iCursorx < (startx + j * pixSize + pixSize - 1)) and (iCursory > (starty + i * pixSize + 1)) and (iCursory < (starty + i * pixSize +
		    pixSize - 1)) then
		if iArray (i, j) = iButton then
		    iArray (i, j) := 0
		else
		    iArray (i, j) := iButton
		end if
	    end if
	end for
    end for

end isInside

proc drawGrid
    for i : minDimension .. upper (grid, 1) %will keep drawing the grid over and over again each time (will change based on the click)
	for j : minDimension .. upper (grid, 2)
	    openGrid

	    if grid (i, j) = 1 then %left click inside the box
		Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, white)

		if mines (i, j) = true then %if a mine is in the position clicked
		    Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, 12)
		    hitMine := true
		    exit
		end if


		locatexy ((startx + j * pixSize + (pixSize div 2) + 1), (starty + i * pixSize + (pixSize div 2) + 1))
		var font1 : int := Font.New ("Arial:10")
		Draw.Text (intstr (mineCount (i, j)), (startx + j * pixSize + (pixSize div 2) - 2), (starty + i * pixSize + (pixSize div 2) - 2), font1, black)

	    elsif grid (i, j) = 3 then     %right click inside the box
		Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, 55)
	    elsif grid (i, j) = 0 then %if no clicks
		Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, 5)
	    end if
	    if win then
		exit
	    end if
	end for
	if win then
	    exit
	end if
	if hitMine = true then
	    exit
	end if
    end for
end drawGrid

proc drawInitialGrid
    for i : minDimension .. upper (grid, 1) %will keep drawing the grid over and over again each time (will change based on the click)
	for j : minDimension .. upper (grid, 2)
	    Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, 5)
	end for
    end for
end drawInitialGrid



