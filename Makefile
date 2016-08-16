CC = gcc
OMPFLAG = -lstdc++
OPTFLAG = -O3

.PHONY: clear

all: main.o

main.o: main.cpp
	$(CC) $(OPTFLAG) $(OMPFLAG) main.cpp -o main.o

test:
	./main.o

clear:
	rm *.o