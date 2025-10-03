
%
O03004
(RC Tippe Body Cavity)
(2025-10-03)
(Target Machine: Haas TL-2)

(-- Material --)
(3/4 sphere held in 3C collet)
(Nylon 600-900 SFM, 0.004 IPR)

(-- Tool Post Position #3 --)
(-- Multiple tool block --)
(Offset 31 : #5 center drill)
(  X = center of drill)
(  Z = tip ? from cutting dia.)
(Offset 32 : 0.25" drill)
(  X = center of drill)
(  Z = tip ? from cutting dia.)
(Offset 33 : 0.5" drill)
(  X = center of drill)
(  Z = tip ? from cutting dia.)
(offset 34 : 3/8" boring bar)
(  X = 0.25" from center matching)
(      inner wall after 0.5" drill)
(  Z = tip of cutting insert)

(-----------------------------------)
(Machine configuration)
G18 (Select ZX plane matching TL-2)
G20 (Inch dimensions)
G40 (Cancel tool nose compensation)
G80 (Cancel any canned cycles)
G97 (Cancel constant suface speed)
G99 (Feed value is feed per rev)

(-----------------------------------)
(Startup)
G97 S500 M03 (Start spindle at RPM)
M97 P999 (Tool change position)
T331 (Center drill)
G54 (Work offset)
G00 X0 Z0.2 (Starting position)
G50 S500 (CSS RPM cap)
G96 S600 (Constant surface speed SFM)

(-----------------------------------)
(Insert actual work here)

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
