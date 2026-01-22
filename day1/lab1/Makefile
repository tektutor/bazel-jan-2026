BIN=./bin

all: main.o hello.o 
	g++ $(BIN)/main.o $(BIN)/hello.o -o $(BIN)/hello

main.o: src/main.cpp
	mkdir -p bin
	g++ -c -I./inc src/main.cpp -o $(BIN)/main.o

hello.o: src/hello.cpp
	mkdir -p bin
	g++ -c -I./inc src/hello.cpp -o $(BIN)/hello.o

clean:
	rm -rf bin 
