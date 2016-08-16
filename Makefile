CC = g++
OMPFLAG = -fopenmp
OPTFLAG = -O3

.PHONY: clear

all: main.o

main.o: main.cpp
	$(CC) $(OPTFLAG) main.cpp -o main.o

test:
	./main.o

clear:
	rm *.o