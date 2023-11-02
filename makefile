CPPFLAGS=-g -DDEBUG

.SUFFIXES:
.SUFFIXES: .cpp .c .cpp .h .o
.c.o: ; gcc $(CPPFLAGS) -c $*.c
.cpp.o: ; g++ $(CPPFLAGS) -c $*.cpp

all: progA progB

clean:
	rm progA progB *.o


progA: utilities.o progA1.o progA2.o
	g++ -g $(CPPFLAGS) utilities.o progA1.o progA2.o
	mv a.out progA

progB: utilities.o progB1.o
	g++ $(CPPFLAGS) utilities.o progB1.o
	mv a.out progB

utilities.o: utilities.cpp utilities.h
	g++ -g -DDEBUG -c utilities.cpp

progA1.o: progA1.cpp utilities.h progA1.h
	g++ -g -DDEBUG -c progA1.cpp

progA2.o: progA2.cpp utilities.h progA1.h
	g++ -g -DDEBUG -c progA2.cpp

progB1.o: progB1.cpp
	g++ -g -DDEBUG -c progB1.cpp
