CPP_STD=-std=c++20
CC=clang++ $(CPP_STD)

SRC=$(wildcard src/**/*.cpp)
OBJ=$(SRC:.cpp=.o)

all: $(OBJ)
	$(CC) -o main $(OBJ)

%.o: %.cpp
	$(CC) -c -o $@ $<

clean:
	rm -f $(OBJ) main

lint:
	clang-tidy $(SRC) -- $(CPP_STD)

format:
	clang-format -i $(SRC)

check-format:
	clang-format -i $(SRC) --dry-run -Werror
