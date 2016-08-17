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
	$(CXX) $(OPTFLAG) main.cpp $(LFLAG) -o main.o

hello.o: hello.cpp
	$(CXX) $(OPTFLAG) hello.cpp -lboost_unit_test_framework -o hello.o

test:
	$(CXX) -fprofile-arcs -ftest-coverage main.cpp -lboost_unit_test_framework -o main.o
	$(CXX) -fprofile-arcs -ftest-coverage hello.cpp -lboost_unit_test_framework -o hello.o
	./main.o
	./hello.o
	gcov main.cpp
	gcov hello.cpp

clear:
	rm *.o
	rm *.gc*