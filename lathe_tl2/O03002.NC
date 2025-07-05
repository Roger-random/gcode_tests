
%
O03002
(RC 75% Sphere)
(2025-06-27)
(Target Machine: Haas TL-2)

(-- Material --)
(Round bar 1" OD)
(Nylon 600-900 SFM, 0.004 IPR)
(Must protrude at least 1.2" plus)
(half width of tool X- code 8)

(-- Tool #2 --)
(C or any shape < 90 deg)
(Tip direction: X- Z- code 3)
(Offset #12 for X, Z, and radius)

(-- Tool #3 --)
(V or any shape < 90 deg)
(Tip direction: X- code 8)
(Offset #13 for X, Z, and radius)

(-- Tool #4 --)
(Part-off tool)
(Offset #14 for X, Z)
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
T0212 (Tool post 2, tool offset 12)
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
(Nub cleanup)
(Should already be at starting pos)
G00 X1.2 Z0.1
(G00 Rapid close to nub)
G00 X0.1 Z0.0
(G01 Linear feed past center)
G01 X-0.05 F0.004
(G00 Rapid away from end of ball)
G00 Z0.1
(G00 Rapid back to start)
G00 X1.2 Z0.1

(-----------------------------------)
(Cut quarter sphere groove)
M97 P999 (Tool change position)
T0313 (Tool post 3, tool offset 13)

(Canned cycle starting position)
G54 (Work offset 54)
G00 X1.2 Z-0.4 (0.1 off XZ)

(-----------------------------------)
(G71 OD stock removal canned cycle)
(P/Q define path start/end)
(U/W define material to leave in X/Z)
(D depth of cut on each pass)
(F feed rate to use while roughing)
G71 P100 Q160 U0.02 W0.01 D0.1 F0.012

(-----------------------------------)
(Quarter spherical groove path)

(This is a Type II path where X)
(changes direction. Haas manual has)
(vague warning about using TNC with)
(type II so no TNC for the canned)
(cycle roughing the groove)

(Geometry math notes:)
(sine of 45 degrees is 0.7071)
(45 degree for 0.5" radius is 0.35355)

(1st line w/X + Z Signifies Type II)
N100 G00 X1.2 Z-0.5
(G01 Linear feed to first contact)
N110 G01 X1.0 Z-0.5 F0.004
(G03 Counter-clockwise arc to valley)
N120 G03 X0.7071 Z-0.8535 R0.5
(G01 Linear 45 deg exit slope)
N130 G01 X1.0 Z-1.0
(Now cut an extra groove for grip)
(G01 Linear 45 in for 0.1)
N140 G01 X0.8 Z-1.1
(G01 Linear 45 back out)
N150 G01 X1.0 Z-1.2
(G00 Rapid away from material)
N160 G00 X1.2

(-----------------------------------)
(G70 finishing cycle on groove)
(P/Q define path start/end)
G70 P100 Q160

(-----------------------------------)
(Final clean up of the quarter)
(sphere side of groove w/TNC path)

(Rapid to spherical equator)
G00 X1.2 Z-0.5
(G42 Tool nose compensation right)
G42
(G00 Rapid entry move towards start)
G00 X1.1
(G01 Linear feed to first contact)
G01 X1.0 F0.004
(G03 Counter-clockwise arc to valley)
G03 X0.7071 Z-0.8535 R0.5
(G00 Rapid away from material)
G00 X1.1
(G40 Cancel tool nose compensation)
G40
(G00 Rapid TNC exit move)
G00 X1.2

(-----------------------------------)
(Part off 75% sphere)
M97 P999 (Tool change position)
T0414 (Tool post 4, tool offset 14)
G54 (Work offset 54)
(G00 Rapid move to cutting Z)
G00 X1.2 Z-0.8535
(G01 Linear feed to cut)
G01 X0 F0.004
(G00 Rapid back out)
G00 X1.2
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
