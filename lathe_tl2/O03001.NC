
%
O03001
(RC Hemisphere)
(2025-06-27)
(Target Machine: Haas TL-2)

(-- Material --)
(Round bar 1" OD)
(Nylon 600-900 SFM, 0.004 IPR)

(-- Tool #2 --)
(C or any shape < 90 deg)
(Tip direction: X- Z- code 3)
(Offset #11 for X, Z, and radius)

(-- Tool #4 --)
(Part-off tool)
(Offset #12 for X, Z)
(Z offset is part side edge)
(A.k.a. Z of test cut - blade width)

(-----------------------------------)
(Machine configuration)
G18 (Select ZX plane matching TL-2)
G20 (Inch dimensions)
G40 (Cancel tool nose compensation)
G80 (Cancel any canned cycles)
G97 (Cancel constant suface speed)
G99 (Feed value is feed per rev)

(Startup)
G97 S500 M03 (Cancel CSS, 500 RPM)
M97 P999 (Tool change position)
T202 (Tool post 2, tool offset 2)
G54 (Work offset 54)
G00 X0. Z0.2 (0.2" off stock end)
G50 S3500 (CSS max 3500 RPM)
G96 S800 (CSS at 800 SFM)

(-----------------------------------)
(G72 Face stock removal canned cycle)
(P/Q define path start/end)
(U/W define material to leave in X/Z)
(D depth of cut on each pass)
(F feed rate to use while roughing)
G72 P10 Q70 U0.02 W0.01 D0.1 F0.012

(-----------------------------------)
(Hemisphere cutting path definition)
(G42 Tool nose compensation right)
N10 G42
(G00 Rapid entry move towards start)
N20 G00 X0. Z0.1
(G01 Linear feed to first contact)
N30 G01 X0. Z0. F0.004
(G03 Counter-clockwise arc)
N40 G03 X1. Z-0.5 R0.5 F0.004
(G01 Linear feed away from material)
N50 G01 X1.2 Z-0.5 F0.004
(G40 Cancel tool nose compensation)
N60 G40
(G00 Rapid exit move further away)
N70 G00 X1.2 Z0.1

(-----------------------------------)
(G70 Finishing cycle)
(P/Q define path start/end)
G70 P10 Q70

(-----------------------------------)
(Part off hemisphere)
M97 P999 (Tool change position)
T404 (Tool post 4, tool offset 4)
G54 (Work offset 54)
(G00 Rapid move to cutting Z)
G00 X1.5 Z-0.5
(G01 Linear feed to cut)
G01 X0 Z-0.5 F0.004
(G00 Rapid back out)
G00 X1.2 Z-0.5
(G00 Rapid further away)
G00 X1.2 Z0.1

(-----------------------------------)
(Conclusion)
G97 S500 (Cancel CSS,speed to 500RPM)
M97 P999 (Tool change position)
M05 (Spindle stop)
M30 (End of Program, rewind to start)

(-----------------------------------)
(Subroutine to tool change position)
N999 (Subroutine identifier)
(X is specific to 1" diameter stock)
(0.25" back on X & 8" right of part)
G54 G00 X1.5 Z8.
M99 (Return to caller)
%
