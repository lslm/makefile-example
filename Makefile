# -*- MakeFile -*-

CC = clang++
CFLAGS = -Ilib/glfw/include -Ilib/glad/include
LDFLAGS = lib/glfw/src/libglfw3.a lib/glad/src/glad.o
LDFLAGS += -framework OpenGL -framework IOKit -framework CoreVideo -framework Cocoa

SRC  = $(wildcard src/*.cpp)
OBJ  = $(SRC:.c=.o)
BIN = bin

all: dirs libs game

libs:
	cd lib/glad && $(CC) -o src/glad.o -Iinclude -c src/glad.c
	cd lib/glfw && cmake . && make

dirs:
	mkdir -p ./$(BIN)

game: $(OBJ)
	$(CC) -o $(BIN)/result $^ $(LDFLAGS)

%.o: %.cpp
	$(CC) -o $@ -c $< $(CFLAGS)

clean:
	rm -rf $(BIN) $(OBJ)