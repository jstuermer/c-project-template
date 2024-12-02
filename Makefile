# Compiler and flags
CC = gcc-14
CFLAGS = -std=c17 -Wall -Wextra
INCLUDES = -I ./include 
TEST_INCLUDES = -I /opt/homebrew/Cellar/cunit/2.1-3/include -L /opt/homebrew/Cellar/cunit/2.1-3/lib

# Source files
MAINS = src/main.c
SOURCES = $(filter-out $(MAINS), $(wildcard src/*.c))
TESTS = $(wildcard tests/*.c)

# Object files
OBJECTS_MAINS = $(patsubst src/%.c, obj/%.o, $(MAINS))
OBJECTS = $(patsubst src/%.c, obj/%.o, $(SOURCES))
OBJECTS_TESTS = $(patsubst tests/%.c, obj/tests/%.o, $(TESTS))

# Target executable
TARGET = build/run
TARGET_TESTS = build/test

# Rules
default: $(TARGET)

$(TARGET): $(OBJECTS_MAINS) $(OBJECTS)
	$(CC) -o $@ $^ $(CFLAGS)

obj/%.o: src/%.c
	$(CC) -c $< -o $@ $(INCLUDES) $(CFLAGS)

tests: $(TARGET_TESTS)

$(TARGET_TESTS): $(OBJECTS) $(OBJECTS_TESTS)
	$(CC) -o $@ $^ $(TEST_INCLUDES) -l cunit $(CFLAGS)

obj/tests/%.o: tests/%.c
	$(CC) -c $< -o $@ $(INCLUDES) $(TEST_INCLUDES) -l cunit $(CFLAGS)

clean:
	rm -f obj/*.o
	rm -f obj/tests/*.o
	rm -f build/*
