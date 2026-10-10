# Makefile for ytwatch

SWIFTc = swiftc
TARGET = ytwatch
SRC = ytwatch.swift

.PHONY: all clean run

all: $(TARGET)

$(TARGET): $(SRC)
	$(SWIFTc) $(SRC) -o $(TARGET)

clean:
	rm -f $(TARGET)

run: $(TARGET)
	./$(TARGET)
