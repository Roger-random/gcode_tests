
%
O12345
(Template for TL2)
(12345678901234567890123456789012345)
(Restrict comments to 35 chars wide)

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
(Cutting operations)

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
