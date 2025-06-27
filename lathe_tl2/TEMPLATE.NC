
%
O12345
(Template for TL2)
(123456789012345678901234567890123456789012345)
(Restrict comments to width of 45 characters)

(---------------------------------------------)
(Machine configuration)
G18 (Select ZX plane matching TL-2 capability)
G20 (Inch dimensions, must match setting #9)
G40 (Cancel tool nose compensatiaon)
G80 (Cancel any canned cycle)
G97 (Cancel constant suface speed mode)
G99 (Feed value is feed per spindle revolution)

(Startup)
G97 S500 M03 (Cancel CSS, 500 RPM forward)
M97 P999 (Tool change position)
T111 (Tool post position 1, tool offset 11)
G54 (Work offset 54)
G00 X1.2 Z0.1 (0.1" off 1" stock in X and Z)
G50 S1500 (Constant suface speed max 1500 RPM)
G96 S800 (Constant surface speed 800 SFM)

(---------------------------------------------)
(Cutting operations)

(---------------------------------------------)
(Conclusion)
M97 P999 (Tool change position)
M05 (Spindle stop)
M30 (End of Program, rewind to beginning)

(---------------------------------------------)
(Start of subroutines)

(---------------------------------------------)
(Move to a position safe for tool changes)
N999 (Subroutine identifier)
(Back off 0.25" and move to 4" right of part)
G54 G00 X1.5 Z4.
M99 (Return to caller)
%
