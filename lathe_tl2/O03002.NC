
%
O03002
(RC Ball End)
(2025-06-27)
(Target Machine: Haas TL-2)

(-- Material --)
(Round bar 1" OD)
(Nylon 600-900 SFM, 0.004 IPR)

(-- Tool #1 --)
(C or any shape < 90 deg)
(Tip direction: X- Z- code 3)
(Offset #11 for X, Z, and radius)

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
T111 (Tool post 1, tool offset 11)
G54 (Work offset 54)
G00 X1.2 Z0.1 (0.1" off 1" stock X&Z)
G50 S1500 (CSS max 1500 RPM)
G96 S800 (CSS at 800 SFM)

(-----------------------------------)
(G72 Face stock removal canned cycle)
(P/Q define path start/end)
(U/W define material to leave in X/Z)
(D depth of cut on each pass)
(F feed rate to use while roughing)
G72 P10 Q70 U0.02 W0.01 D0.1 F0.004

(-----------------------------------)
(Hemisphere cutting path definition)
(G42 Tool nose compensation right)
N10 G42
(G00 Rapid entry move towards start)
N20 G00 X0.0 Z0.1
(G01 Linear feed to first contact)
N30 G01 X0.0 Z0.0 F0.004
(G03 Counter-clockwise arc)
N40 G03 X1.0 Z-0.5 F0.004
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
(Finishing up)
G97 S500 (Cancel CSS speed to 500RPM)
G54 (Work offset 54)
G00 X1.2 Z0.1 (0.1" off 1" stock X&Z)

(-----------------------------------)
(Conclusion)
M97 P999 (Tool change position)
M05 (Spindle stop)
M30 (End of Program, rewind to start)

(-----------------------------------)
(Subroutine to tool change position)
N999 (Subroutine identifier)
(X is specific to 1" diameter stock)
(0.25" back on X & 4" right of part)
G54 G00 X1.5 Z4.
M99 (Return to caller)
%
