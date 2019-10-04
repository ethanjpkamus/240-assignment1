#/bin/bash

#Author: Ethan Kamus
#Email: ethanjpkamus@csu.fullerton.edu

#remove old/unwanted files
rm *.o
rm *.out
rm *.lis

echo "Assemble assignment1.asm"
nasm -f elf64 -l assignment1.lis -o assignment1.o assignment1.asm

echo "Compile driver.cpp"
g++ -c -Wall -m64 -std=c++14 -o myfile.o -fno-pie -no-pie driver.cpp

echo "Link all object files"
g++ -m64 -std=c++14 -fno-pie -no-pie myfile.o assignment1.o -o myprog.out

echo "Now the program will run"
./myprog.out
