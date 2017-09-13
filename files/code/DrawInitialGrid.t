proc drawInitialGrid
    for i : minDimension .. upper (grid, 1) %will keep drawing the grid over and over again each time (will change based on the click)
	for j : minDimension .. upper (grid, 2)
	    Draw.FillBox (startx + j * pixSize + 1, starty + i * pixSize + 1, startx + j * pixSize + pixSize - 1, starty + i * pixSize + pixSize - 1, 5)
	end for
    end for
end drawInitialGrid
