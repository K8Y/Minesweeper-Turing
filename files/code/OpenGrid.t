proc openGrid %opens squares touching 0 that were open
    for decreasing i : upper (grid, 1).. minDimension
	for decreasing j : upper (grid,2).. minDimension 
	    if i < upper (grid, 1) then
		if grid (i + 1, j) = 1 and mineCount (i + 1, j) = 0 and mines (i + 1, j) = false and grid (i, j) not= 3 then
		    grid (i, j) := 1
		end if

		if j < upper (grid, 2) then
		    if grid (i + 1, j + 1) = 1 and mineCount (i + 1, j + 1) = 0 and mines (i + 1, j + 1) = false and grid (i, j) not= 3 then
			grid (i, j) := 1
		    end if
		end if

	    end if

	    if i > minDimension then
		if grid (i - 1, j) = 1 and mineCount (i - 1, j) = 0 and mines (i - 1, j) = false and grid (i, j) not= 3 then
		    grid (i, j) := 1
		end if

		if j > minDimension then
		    if grid (i - 1, j - 1) = 1 and mineCount (i - 1, j - 1) = 0 and mines (i - 1, j - 1) = false and grid (i, j) not= 3 then
			grid (i, j) := 1
		    end if
		end if
	    end if

	    if j > minDimension then
		if grid (i, j - 1) = 1 and mineCount (i, j - 1) = 0 and mines (i, j - 1) = false and grid (i, j) not= 3 then
		    grid (i, j) := 1
		end if

		if i < upper (grid, 1) then
		    if grid (i + 1, j - 1) = 1 and mineCount (i + 1, j - 1) = 0 and mines (i + 1, j - 1) = false and grid (i, j) not= 3 then
			grid (i, j) := 1
		    end if
		end if
	    end if

	    if j < upper (grid, 2) then
		if grid (i, j + 1) = 1 and mineCount (i, j + 1) = 0 and mines (i, j + 1) = false and grid (i, j) not= 3 then
		    grid (i, j) := 1
		end if

		if i > minDimension then
		    if grid (i - 1, j + 1) = 1 and mineCount (i - 1, j + 1) = 0 and mines (i - 1, j + 1) = false and grid (i, j) not= 3 then
			grid (i, j) := 1
		    end if
		end if
	    end if



	end for
    end for
end openGrid
