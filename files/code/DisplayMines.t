proc displayMines %when the game ends
    var clr : int

    if hitMine = true then
	clr := 12
    else
	clr := 55
    end if

    for i : minDimension .. upper (mines, 1)
	for j : minDimension .. upper (mines, 2)
	    if mines (i, j) then
		Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, clr)
	    end if
	end for
    end for
end displayMines
