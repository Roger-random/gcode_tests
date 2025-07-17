
%
O03003
(RC 75% Sphere V2)
(2025-07-09)
(Target Machine: Haas TL-2)

(-- Material --)
(Round bar 1" OD)
(Nylon 600-900 SFM, 0.004 IPR)
(G54 Z0 must be at least 1.25" away)
(from bar workholding face Z.)

(-- Tool #3 --)
(V shape 35 deg)
(Tip direction: X- Z- code 3)
(Offset #13 for X, Z, and radius)

(-- Tool #4 --)
(Part-off tool)
(Offset #14 for X, Z)
(Z offset is part side edge)
(A.k.a. Z of test cut - blade width)
(Stock side edge is Z-0.123" further)

(-----------------------------------)
(Machine configuration)
G18 (Select ZX plane matching TL-2)
G20 (Inch dimensions)
G40 (Cancel tool nose compensation)
G80 (Cancel any canned cycles)
G97 (Cancel constant suface speed)
G99 (Feed value is feed per rev)

(Startup)
G97 S500 M03 (Start spindle at RPM)
M97 P999 (Tool change position)
T313 (Body cutter posit and offset)
G54 (Work offset)
G00 X1.4 Z0.2 (Starting position)
G50 S3500 (CSS RPM cap)
G96 S600 (Constant surface speed SFM)

(G42 Tool nose compensation right)
G42
(G00 Rapid TNC entry move)
G00 X1.2 Z0.1 (Closer to stock)

(-----------------------------------)
(G71 OD stock removal canned cycle)
(P/Q define path start/end)
(U/W define material to leave in X/Z)
(D depth of cut on each pass)
(F feed rate to use while roughing)
G71 P100 Q150 U0.02 W0.01 D0.1 F0.012

(-----------------------------------)
(Type II path = one where X changes)
(direction. We notify the control)
(control we're doing Type II with)
(both X and Z values on first line)
(or we'll get a "non-monotonic X")
(alarm)

(Geometry math notes:)
(sine of 45 degrees is 0.7071)
(45 degree for 0.5" radius is 0.3535)

(1st line w/X + Z Signifies Type II)
N100 G00 X0. Z0.1
(G01 Linear feed to first contact)
N110 G01 Z0. F0.004
(G03 Counter-clockwise arc for ball)
N120 G03 X0.7071 Z-0.8535 R0.5
(G01 Linear cut width of POT #4)
N130 G01 Z-0.9765
(G01 Linear exit)
N140 G01 X1.
(G00 Rapid away from material)
N150 G00 X1.2

(-----------------------------------)
(G70 finishing cycle)
(P/Q define path start/end)
G70 P100 Q150

(G40 Cancel tool nose compensation)
G40
(G00 Rapid TNC exit move)
G00 X1.4 Z0.2 (Rapid away from stock)

(-----------------------------------)
(Z0. will trim off the nub)
(Z<0 adds a bit of flat to bottom)

(Rapid in to closer X and desired Z)
G00 X0.1 Z0.0
(Feed in and back out)
G01 X-0.1 F0.004
G01 X0.1
(Rapid back out to starting posit)
G00 X1.4 Z0.2

(-----------------------------------)
(Part off 75% sphere)
M97 P999 (Tool change position)
T414 (Part-off tool posit and offset)
G54 (Work offset)
(G00 Rapid move to cutting Z)
G00 X1.2 Z-0.8535
(G01 Linear feed to cut)
G01 X0 F0.004
(G00 Rapid back out)
G00 X1.2

(Bar puller groove)
(G00 Rapid to position)
G00 X1.2 Z-1.05
(G01 Linear feed to cut groove)
G01 X0.8 F0.004
(G00 Rapid back out)
G00 X1.2

(G00 Rapid back to starting position)
G00 X1.4 Z0.2 (Rapid away from stock)

(-----------------------------------)
(Conclusion)
G97 S500 (Back to fixed RPM)
M97 P999 (Tool change position)
M05 (Spindle stop)
M30 (End of Program, rewind to start)

(-----------------------------------)
(Subroutine to tool change position)
N999 (Subroutine identifier)
(X is specific to stock diameter)
G54 G00 X1.5 Z8.
M99 (Return to caller)
%
