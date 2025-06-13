%
O03000 ;
(RC Hello Facing)
(2025-06-13)
(Haas TL-2)
(Stock: Round bar 1" OD)
(Nylon: 600-900 SFM, 0.004" inches per revolution)

(---------------------------------------------------------)
(Boilerplate startup)
G18; (Select ZX plane even though TL-2 only runs in ZX anyway)
G20; (Dimensions are in inches, must match Haas control setting 9)
G40; (Cancel tool nose compensatiaon in case previously active)
G80; (Cancel any canned cycle that might have been active)
G97; (Cancel constant suface speed mode, S now RPM value)
G99; (Feed value is feed per spindle revolution)
G28 U0; (Pull away from centerline to X home)
G28 W0; (Tool safely away, move to Z home)

(---------------------------------------------------------)
(TODO: Define path)
(TODO: G72 End face stock removal cycle)
(TODO: G70 Finishing cycle)

(---------------------------------------------------------)
(Boilerplate ending)
G28 U0; (Pull away from centerline to X home)
G28 W0; (Tool safely away, move to Z home)
M05; (Spindle stop)
M09; (Coolant off)
M30; (End of Program, rewind cursor to beginning)

(---------------------------------------------------------)
(Start of subroutines)

(---------------------------------------------------------)
(Move to a position safe for tool changes)
N999; (Subroutine identifier)
G54 X1.5 Z4.0; (Back off 1.5" and move to 4" right of part)
M99; (Return to caller)
%
