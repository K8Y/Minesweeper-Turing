var temp, temp2 : int := Rand.Int (1, upper (grid, 1))
var ctr : int := 0

proc generateMines (var iArray : array minDimension .. *, minDimension .. * of boolean)
    %randomly generates coordinates for the mines to be placed

    ctr := 0
    for i : minDimension .. upper (iArray, 1)
	for j : minDimension .. upper (iArray, 2)
	    iArray (i, j) := false
	end for
    end for

    loop
	exit when ctr >= numberOfMines
	if iArray (temp, temp2) = false then
	    iArray (temp, temp2) := true
	    ctr += 1
	end if
	temp := Rand.Int (minDimension, upper (grid, 1))
	temp2 := Rand.Int (minDimension, upper (grid, 1))
    end loop

end generateMines

%need to generate miens after first click
%maybe get mouse click from main and then do an if (if X and Y equal this then temp and temp2 cannot equal that)
