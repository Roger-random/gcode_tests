
%
O03000 
(RC Hello Facing) 
(2025-06-13) 
(Haas TL-2) 
(Stock: Round bar 1" OD) 
(Nylon: 600-900 SFM, 0.004" inches per revolution) 

(---------------------------------------------------------) 
(Boilerplate startup) 
G18 (Select ZX plane even though TL-2 only runs in ZX anyway) 
G20 (Dimensions are in inches, must match Haas control setting 9) 
G40 (Cancel tool nose compensatiaon in case previously active) 
G80 (Cancel any canned cycle that might have been active) 
G97 (Cancel constant suface speed mode, S now RPM value) 
G99 (Feed value is feed per spindle revolution) 

(---------------------------------------------------------) 
G97 S500 M03 (Cancel CSS, target speed 500 RPM, spindle forward) 
M97 P999 (Call subroutine 999 for Safe Tool Change Position) 
T111 (Tool post position 1, tool offset 11) 
G54 (Work offset 54) 
G00 X1.2 Z0.1 (Move to 0.1" off 1" stock in X and Z) 
G50 S1500 (Cap max RPM of constant suface speed mode to 1500) 
G96 S800 (Constant surface speed of 800 SFM) 
G00 Z-0.05 (Move cutter to 0.05" inside end of stock but still off X surface.) 
G01 X0. F0.004 (Move cutter to centerline, facing 0.05" off the end of stock) 
G00 Z0. (Move cutter to end of stock, should be empty air) 
M97 P999 

(---------------------------------------------------------) 
(Boilerplate ending) 
M05 (Spindle stop) 
M09 (Coolant off) 
M30 (End of Program, rewind cursor to beginning) 

(---------------------------------------------------------) 
(Start of subroutines) 

(---------------------------------------------------------) 
(Move to a position safe for tool changes) 
N999 (Subroutine identifier) 
G54 G00 X1.5 Z4. (Back off 0.25" and move to 4" right of part) 
M99 (Return to caller) 
%
