DIR := ${CURDIR}

exec = bin/libtest.out
sources = $(wildcard src/*.cpp)
objects = $(sources:.cpp=.o)
flags = -g -Wall -lallegro_font -lallegro

$(exec): $(objects)
	g++ $(objects) $(flags) -o $(exec)

%.o: %.c include/%.h
	g++ -c $(flags) $< -o $@

clean:
	-rm *.out
	-rm *.o
	-rm *.a
	-rm src/*.o

run: $(exec)
	./$(exec)
