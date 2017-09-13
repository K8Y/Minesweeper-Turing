%when an empty square (with 0 miines around it) is clicked, all surrounding squares are uncovered until
%it hits squares with numbers


proc openEmptySquaresUp (h, v : int)

    if h < maxDimension then
	if mineCount (h + 1, v) = 0 then
	    grid (h + 1, v) := 1
	    openEmptySquaresUp (h + 1, v)
	end if
    end if


end openEmptySquaresUp


proc openEmptySquaresDown (h, v : int)

    if h > minDimension then
	if mineCount (h - 1, v) = 0 then
	    grid (h - 1, v) := 1
	    openEmptySquaresDown (h - 1, v)
	end if
    end if


end openEmptySquaresDown


proc openEmptySquaresRight (h, v : int)

    if v < maxDimension then
	if mineCount (h, v + 1) = 0 then
	    grid (h, v + 1) := 1
	    openEmptySquaresRight (h, v + 1)
	end if
    end if


end openEmptySquaresRight

proc openEmptySquaresLeft (h, v : int)

    if v > minDimension then
	if mineCount (h, v - 1) = 0 then
	    grid (h, v - 1) := 1
	    openEmptySquaresLeft (h, v - 1)
	end if
    end if


end openEmptySquaresLeft



proc openEmptySquares (h, v : int)

    openEmptySquaresUp (h, v)
    openEmptySquaresDown (h, v)
    openEmptySquaresRight (h, v)
    openEmptySquaresLeft (h, v)


end openEmptySquares
