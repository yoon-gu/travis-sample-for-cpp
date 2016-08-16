ifeq ($(CC),)
    CC = gcc
endif
LFLAG = -lstdc++
FFLAG = -fopenmp
OPTFLAG = -O3

.PHONY: clear

all: main.o

main.o: main.cpp
	$(CC) $(OPTFLAG) main.cpp $(LFLAG) -o main.o

test:
	./main.o

clear:
	rm *.o