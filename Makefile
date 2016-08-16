ifeq ($(CC),)
    CC = gcc
endif
ifeq ($(CXX),)
    CXX = g++
endif
LFLAG = -lstdc++
FFLAG = -fopenmp
BOOST = /usr/local/Cellar/boost/1.55.0_2
OPTFLAG = -O3

.PHONY: clear

all: main.o test_sample.o

main.o: main.cpp
	$(CC) $(OPTFLAG) main.cpp $(LFLAG) -o main.o

test_sample.o: test_sample.cpp
	$(CXX) -coverage -O0 -Wall -I $(BOOST) test_sample.cpp $(LFLAG) -o test_sample.o

test:
	$(CC) -coverage -O0 main.cpp $(LFLAG)
	./main.o
	./test_sample.o
	gcov main.cpp test_sample.cpp

clear:
	rm *.o
	rm *.gcov