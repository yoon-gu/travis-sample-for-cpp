ifeq ($(CC),)
    CC = gcc
endif
LFLAG = -lstdc++
FFLAG = -fopenmp
OPTFLAG = -O3

.PHONY: clear

all: main.o test_sample.o

main.o: main.cpp
	$(CC) $(OPTFLAG) main.cpp $(LFLAG) -o main.o

test_sample.o: test_sample.cpp
	$(CC) -coverage -O0 -Wall test_sample.cpp $(LFLAG) -o test_sample.o

test:
	$(CC) -coverage -O0 main.cpp $(LFLAG)
	./main.o
	./test_sample.o
	gcov main.cpp test_sample.cpp

clear:
	rm *.o
	rm *.gcov