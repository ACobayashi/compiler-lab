ROOT := ../..
BUILD := build
RUNTIME := $(ROOT)/riscv/lib/sylib.c
CLANG ?= clang
LLVM_AS ?= llvm-as
LLI ?= lli

.PHONY: all test test-native test-lli clean

all: $(BUILD)/main-native $(BUILD)/main.bc $(BUILD)/sylib.so

$(BUILD):
	mkdir -p $@

$(BUILD)/main.o: main.ll | $(BUILD)
	$(CLANG) -c -x ir $< -o $@

$(BUILD)/sylib.o: $(RUNTIME) | $(BUILD)
	$(CLANG) -c $< -o $@

$(BUILD)/main-native: $(BUILD)/main.o $(BUILD)/sylib.o
	$(CLANG) $^ -o $@

$(BUILD)/main.bc: main.ll | $(BUILD)
	$(LLVM_AS) $< -o $@

$(BUILD)/sylib.so: $(RUNTIME) | $(BUILD)
	$(CLANG) -shared -fPIC $< -o $@

test: test-native test-lli

test-native: all
	@for input in tests/case*.in; do \
	  echo "== native: $$input =="; \
	  $(BUILD)/main-native < "$$input"; \
	done

test-lli: all
	@for input in tests/case*.in; do \
	  echo "== lli: $$input =="; \
	  $(LLI) -load=$(BUILD)/sylib.so main.ll < "$$input"; \
	done

clean:
	rm -rf $(BUILD)
