ifeq ($(CC),)
    CC = gcc
endif
ifeq ($(CXX),)
    CXX = g++
endif
LFLAG = -lstdc++
FFLAG = -fopenmp
OPTFLAG = -O3

.PHONY: clear

all: main.o hello.o

main.o: main.cpp
	$(CC) $(OPTFLAG) main.cpp $(LFLAG) -o main.o

hello.o: hello.cpp
	$(CXX) -o hello.o -lboost_unit_test_framework hello.cpp $(LFLAG)

test:
	$(CC) -coverage -O0 main.cpp $(LFLAG)
	$(CXX) -coverage -lboost_unit_test_framework hello.cpp $(LFLAG)
	./main.o
	./hello.o
	gcov main.cpp hello.cpp

clear:
	rm *.o
	rm *.gcov