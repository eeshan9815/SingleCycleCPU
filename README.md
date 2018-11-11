# Single Cycle CPU

## Schematic Diagram

`CPUBlockDiagram.svg` contains the the block diagram of the top-level module
`SingleCycleCPU.v`

## UCF File

The `UCF` file maps the clock, reset and 8 least significant bits of the ALU output to the ports on the FPGA.

## Compilation

Bubble Sort program was created first as a C program in `BubbleSort.cpp`, then translated
to MIPS based language in `BubbleSort.asm`, then translated to `BubbleSort.risc` by
translating to corresponding KGP-RISC instructions, then translated to
`BubbleSortOptimized.risc` by removing all spaces and associating each memory with
a location, then translated to `BubbleSortFinal.risc` by replacing all Labels with relative
jump offsets. BubbleSortFinal.risc was converted to `BubbleSort.coe`, which
contains the machine language code, using `Compiler.cpp`.

## Instruction Loading

COE file is loaded into the BRAM in the Instruction Memory by regenerating the core.
PS: A smaller, shorter, yet comprehensive, coe file (`Text.coe`) is also created for more practical testing.

## Control Unit Signals

Control unit raises the control signals corresponding to each instruction fetched from the
Instruction Memory. This mapping is described in the Excel sheet
`InstructionCodes.xlsx`.

## Results

The *Simulated (Post-Route) Model* is shown in the image `Capture(Bubble Sort).png`. Also, bit stream generated and programmed on the FPGA, although with clock limitations.

## Contributors

[Eeshan Gupta](https://github.com/eeshan9815)

[Arpit Jain](https://github.com/arpitkjain)
