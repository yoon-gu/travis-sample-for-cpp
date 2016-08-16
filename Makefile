CC = gcc
LFLAG = -lstdc++
FFLAG = -fopenmp
OPTFLAG = -O3

.PHONY: clear

all: main.o

main.o: main.cpp
	$(CC) $(OPTFLAG) $(LFLAG) main.cpp -o main.o

test:
	./main.o

clear:
	rm *.o