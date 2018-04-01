my_os
========
This is a DIY(do-it-yourself) OS tutorial

Quick Start
--------
1. Clone this repo, `git clone git://github.com/e-eq-mc2/my_os.git`, or `git clone https://github.com/e-eq-mc2/my_os.git`.

2. Prepare a cross-compiler for Intel 80386 and CPU ELF Format  
Refer the script below which is supposed to run on macOS Sierra.  
`cross_compiler/install_tools.sh`

3. Prepare **qemu**  
`$ brew install qemu`

4. make and run  
`$ cd step0 && make && make run`

Progress
--------
- 16bit Real Mode
  - Step 0
  ![](img/step0.png?raw=true)
  
  - Step 1
  ![](img/step1.png?raw=true)
  
  - Step 2
  ![](img/step2.png?raw=true)

- 32bit Protected Virtual Address Mode
  - Step 3
  ![](img/step3.png?raw=true)

  - Step 4
  ![](img/step4.png?raw=true)

References
--------
- [Writing a Simple Operating System from Scratch](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf)
- [The little book about OS development](https://littleosbook.github.io/)
- [Operating Systems: From 0 to 1](https://github.com/tuhdo/os01)
- [x86 Assembly](https://en.wikibooks.org/wiki/X86_Assembly)
- [Intel 64 and IA-32 Architectures Software Developer Manuals](https://software.intel.com/en-us/articles/intel-sdm)
- [8086 family Users Manual 1](https://edge.edx.org/c4x/BITSPilani/EEE231/asset/8086_family_Users_Manual_1_.pdf)
- [8086 Addressing Modes page](http://www.ic.unicamp.br/~celio/mc404s2-03/addr_modes/intel_addr.html)

Authours
--------
Naoki Nishizawa
* <http://github.com/e-eq-mc2>

Key Words
--------
OS, Assembler(GAS), Linker script, C Language, Intel 8086, Intel 80386
