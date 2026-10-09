ROOT := ../..
BUILD ?= build
SOURCE := src/handwritten.ll
REFERENCE := reference/reference.c
SYSY := $(ROOT)/shared/sysy/main.sy
RUNTIME := $(ROOT)/shared/sysy/lib/sylib.c
RUNTIME_HEADER := $(ROOT)/shared/sysy/lib/sylib.h
CLANG ?= clang-14
LLVM_AS ?= llvm-as-14
LLI ?= lli-14
OPT ?= opt-14

.PHONY: all reference-ir test test-native test-lli clean

all: $(BUILD)/ir-native $(BUILD)/handwritten.bc $(BUILD)/sylib.so $(BUILD)/source-native

$(BUILD):
	mkdir -p $@

$(BUILD)/handwritten.o: $(SOURCE) | $(BUILD)
	$(CLANG) -c -x ir $< -o $@

$(BUILD)/sylib.o: $(RUNTIME) $(RUNTIME_HEADER) | $(BUILD)
	$(CLANG) -c $< -o $@

$(BUILD)/ir-native: $(BUILD)/handwritten.o $(BUILD)/sylib.o
	$(CLANG) $^ -o $@

$(BUILD)/handwritten.bc: $(SOURCE) | $(BUILD)
	$(LLVM_AS) $< -o $@

$(BUILD)/sylib.so: $(RUNTIME) $(RUNTIME_HEADER) | $(BUILD)
	$(CLANG) -shared -fPIC $< -o $@

$(BUILD)/source-native: $(REFERENCE) $(SYSY) $(RUNTIME) $(RUNTIME_HEADER) | $(BUILD)
	$(CLANG) -O0 $(REFERENCE) $(RUNTIME) -o $@

reference-ir: $(BUILD)/reference.ll $(BUILD)/reference.ssa.ll

$(BUILD)/reference.ll: $(REFERENCE) $(SYSY) | $(BUILD)
	$(CLANG) -O0 -S -emit-llvm -fno-discard-value-names $(REFERENCE) -o $@

$(BUILD)/reference.promotable.ll: $(REFERENCE) $(SYSY) | $(BUILD)
	$(CLANG) -O0 -Xclang -disable-O0-optnone -S -emit-llvm -fno-discard-value-names $(REFERENCE) -o $@

$(BUILD)/reference.ssa.ll: $(BUILD)/reference.promotable.ll
	$(OPT) -S -passes=mem2reg $< -o $@

test: all
	@mkdir -p $(BUILD)/results
	@set -eu; for input in tests/case*.in; do \
	  name=$$(basename "$$input" .in); \
	  $(BUILD)/source-native < "$$input" > "$(BUILD)/results/$$name.source.out" 2> "$(BUILD)/results/$$name.source.err"; \
	  $(BUILD)/ir-native < "$$input" > "$(BUILD)/results/$$name.ir.out" 2> "$(BUILD)/results/$$name.ir.err"; \
	  $(LLI) -load=$(BUILD)/sylib.so $(BUILD)/handwritten.bc < "$$input" > "$(BUILD)/results/$$name.lli.out" 2> "$(BUILD)/results/$$name.lli.err"; \
	  diff -u "tests/$$name.expected" "$(BUILD)/results/$$name.source.out"; \
	  diff -u "$(BUILD)/results/$$name.source.out" "$(BUILD)/results/$$name.ir.out"; \
	  diff -u "$(BUILD)/results/$$name.ir.out" "$(BUILD)/results/$$name.lli.out"; \
	  printf '%s: MATCH\n' "$$name"; \
	done

test-native: $(BUILD)/ir-native
	@mkdir -p $(BUILD)/results
	@set -eu; for input in tests/case*.in; do \
	  name=$$(basename "$$input" .in); \
	  $(BUILD)/ir-native < "$$input" > "$(BUILD)/results/$$name.ir.out" 2> "$(BUILD)/results/$$name.ir.err"; \
	  diff -u "tests/$$name.expected" "$(BUILD)/results/$$name.ir.out"; \
	  printf '%s: native MATCH\n' "$$name"; \
	done

test-lli: $(BUILD)/handwritten.bc $(BUILD)/sylib.so
	@mkdir -p $(BUILD)/results
	@set -eu; for input in tests/case*.in; do \
	  name=$$(basename "$$input" .in); \
	  $(LLI) -load=$(BUILD)/sylib.so $(BUILD)/handwritten.bc < "$$input" > "$(BUILD)/results/$$name.lli.out" 2> "$(BUILD)/results/$$name.lli.err"; \
	  diff -u "tests/$$name.expected" "$(BUILD)/results/$$name.lli.out"; \
	  printf '%s: lli MATCH\n' "$$name"; \
	done

clean:
	@test "$(BUILD)" = "build" || { echo "clean only removes build/, never saved experiment artifacts"; exit 1; }
	rm -rf -- "$(BUILD)"
