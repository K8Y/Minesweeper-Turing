%Kaitlyn 
%Program Name: minesweeper
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% displays a intro banner

process displayBanner

    var x := maxrow div 2
    var y := maxcol div 2
    var clr : int := Rand.Int (30, 75)
    var font1 : int


    loop
        font1 := Font.New ("Arial:36:bold,italic")
        clr := Rand.Int (50, 75)
        Font.Draw ("Minesweeper", x, y, font1, clr)
        delay (100)
        exit when isIntroWindowOpen = false
    end loop

    color (black)
end displayBanner

% main procedure to handle the intro window
procedure displayIntroWindow

    % flag that intro screen is open - global var isIntroWindowOpen
    isIntroWindowOpen := true
    % Open the window
    var winID : int
    winID := Window.Open ("position:top;center,graphics:600;400,title:Introduction Window")


    fork displayBanner


    % create a button
    var quitIntroWindowButton := GUI.CreateButton (maxx - 100, 25, 0, "Close", QuitIntroWindowButtonPressed)

    % Window will continue until quit button is pressed
    loop
        exit when GUI.ProcessEvent or isIntroWindowOpen = false
    end loop
    % release the button
    GUI.Dispose (quitIntroWindowButton)
    %close/release the window
    Window.Close (winID)




end displayIntroWindow
