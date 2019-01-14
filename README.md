### ARM Single-Cycle Implementation in Logisim

NOTE: If you don't start early, you will not finish this project. It is worth 15% of your grade.

For this project you are going to implement a single-cycle implementation of a subset of the ARMv7 instruction set using digital logic in Logisim.

Your implementation should be able to execute the machine code versions of the following Project02 functions: sum_array, find_max, fib_iter, and fib_rec.

Your goal is to follow the single-cycle design in DDCA 7.3. However, you will likely have to modify this design to accommodate additional instructions used in the Project02 programs.

I provide a Python script (below) that can be used to convert ARM object code into a text file that can be read by the Logisim ROM (read only memory) component.

You need to submit your Logisim design file to Github.

Note for sum_array you will need to pre-populate RAM with the numbers that make up the input array. You may have to modify your assembly code to assume the array starts at data memory address 0. You will assume your stack pointer starts at the high data memory address.

Other notes and deliverables:
 - You should put the top-level of you CPU on the "main" circuit.
 - Ensure that it is easy to see the state of the CPU (registers).
 - Make each program you support selectable via a "program selection" input. You can implement this using several ROM components and a MUX to select the appropriate instruction word.
 - Be prepared to explain all of your design and implementation choices during interactive grading.

**Extra Credit (1 point each)**
- 24 hours early
- Be creative in displaying the processor state at the top schematic level.
- Replace all Logisim components with your own components built from AND, OR, and NOT gates.
- Implement additional instructions to get find_str() working.
- Implement a multicycle version of your ARM subset as described in DDCA 7.4.
- Implement a pipelined version of your ARM subset as described in DDCA 7.5.
- For the pipelined processor implement branch prediction as described in DDCA 7.7.3.
- Implement a direct mapped cache and integrate it into your single-cycle processor. See DDCA 8.3.2.
- Implement a fully associative cache and integrate it into your single-cycle processor. See DDCA 8.3.2.
- Implement a multi-way set associative cache and integrate it into your single-cycle processor. See DDCA 8.3.2.

**makerom.py**

### makerom.py
 
~~~~
import sys

hexdigits =  ['0','1','2','3','4','5','6','7','8','9','a','b','c','d','e','f']
print "v2.0 raw"

for line in sys.stdin:
    tokens = line.split()
    
    if len(tokens) < 2:
        continue

    if len(tokens[1]) != 8:
        continue

    if tokens[1][0] not in hexdigits:
        continue

    print tokens[1]
 ~~~~

**Usage**

On a Raspberry Pi

~~~~
$ objdump -d file.o | python makerom.py > file_rom.txt
~~~~


**IMPORTANT**



Make sure you .s files DO NOT have the .global or .func directives. These will result in incorrect offset values in the branches.
