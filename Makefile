CXX      = g++
CXXFLAGS = -std=c++14 -g -Wall -Wextra
INCLUDES = -Iinclude

TGT   = test/test_mnist
SRCS  = src/mnist_loader.cc
SRCS += $(TGT).cc
BIN   = $(TGT)
OBJS  = $(SRCS:.cc=.o)
LIBS  =

all: test

compile: $(BIN)

test: $(BIN) data
	./$(BIN)

$(BIN): $(OBJS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) $(OBJS) -o $@ $(LIBS)

.cc.o: $(SRCS)
	$(CXX) $(CXXFLAGS) $(INCLUDES) -c $< -o $@

data:
	@if [ ! -e dataset ]; then \
	./tools/mnist-download.sh; \
	fi

clean:
	rm -rf $(BIN) $(OBJS)

.PHONY: all compile test data clean
