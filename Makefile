ifeq ($(CC),)
    CC = gcc
endif
ifeq ($(CXX),)
    CXX = g++
endif
LFLAG = -lstdc++
FFLAG = -fopenmp
OPTFLAG = -O0

.PHONY: clear

all: main.o hello.o

main.o: main.cpp
	$(CXX) $(OPTFLAG) main.cpp $(LFLAG) -o main.o

hello.o: hello.cpp
	$(CXX) -o hello.o hello.cpp -lboost_unit_test_framework

test:
	$(CXX) -fprofile-arcs -ftest-coverage main.cpp -lboost_unit_test_framework
	$(CXX) -fprofile-arcs -ftest-coverage hello.cpp -lboost_unit_test_framework
	./main.o
	./hello.o
	gcov main.cpp
	gcov hello.cpp

clear:
	rm *.o
	rm *.gcov