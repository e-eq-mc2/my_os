my_os
========
This is a DIY(do-it-yourself) OS tutorial

Quick Start
--------
1. Clone this repo, `git clone git://github.com/e-eq-mc2/my_os.git`, or `git clone https://github.com/e-eq-mc2/my_os.git`.

2. Prepare a cross-compiler for Intel 80386 and CPU ELF Format  
Refer the script below which is supposed to run on macOS Sierra
`cross_compiler/install_tools.sh`

3. Prepare **qemu**  
`$ brew install qemu`

4. make and run  
`$ cd step0 && make && make run`

Progress
--------
- Step 0
![](img/step0.png?raw=true)

- Step 1
![](img/step1.png?raw=true)

- Step 2
![](img/step2.png?raw=true)

Authours
--------
Naoki Nishizawa
* <http://github.com/e-eq-mc2>

Key Words
--------
DIY, OS, GAS