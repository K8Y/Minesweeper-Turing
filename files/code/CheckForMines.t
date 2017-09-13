%checks and counts surrounding mines of the clicked square

var counter : int := 0

%for the mineCount array
proc checkForMines (var iArray : array minDimension .. *, minDimension .. * of int) %checks surrounding squares for mines and stores number of them
    for i : minDimension .. upper (mineCount, 1)
	for j : minDimension .. upper (mineCount, 2)

	    if i < maxDimension then
		if mines (i + 1, j) then
		    counter += 1
		end if

		if j < maxDimension then
		    if mines (i + 1, j + 1) then
			counter += 1
		    end if
		end if

		if j > minDimension then
		    if mines (i + 1, j - 1) then
			counter += 1
		    end if
		end if
	    end if

	    if i > minDimension then
		if mines (i - 1, j) then
		    counter += 1
		end if

		if j < maxDimension then
		    if mines (i - 1, j + 1) then
			counter += 1
		    end if
		end if

		if j > minDimension then
		    if mines (i - 1, j - 1) then
			counter += 1
		    end if
		end if
	    end if

	    if j < maxDimension then
		if mines (i, j + 1) then
		    counter += 1
		end if
	    end if

	    if j > minDimension then
		if mines (i, j - 1) then
		    counter += 1
		end if
	    end if

	    iArray (i, j) := counter

	    counter := 0

	end for
    end for

end checkForMines

%how to determine if player wins
fcn win : boolean
    var ctr, dummyCounter : int := 0
    var temp : boolean := false

    temp := false

    for i : minDimension .. upper (grid, 1)
	for j : minDimension .. upper (grid, 2)
	    if grid (i, j) = 3 then
		if mines (i, j) then
		    ctr += 1
		    dummyCounter += 1
		else
		    dummyCounter += 1
		end if
	    end if
	end for
    end for

    if ctr = numberOfMines and dummyCounter = numberOfMines then
	temp := true
    else
	temp := false
    end if
    result temp
end win
