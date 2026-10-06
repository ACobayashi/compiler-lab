# Member B: compilation-pipeline exercise

This folder preserves the independent C exercise used for the first
compilation-pipeline task. It does not modify the team lead's RISC-V files.

- `q1/src/main.c` and `q1/include/config.h`: the source and macro used in the
  preprocessor, token/AST, LLVM IR, optimization, and AArch64 observations.
- `q1/input/sample.txt`: the recorded sample input (`5`, then `1 2 3 4 5`).
- `../../report/figures/memberB/q1/`: the original screenshots, copied from
  the prework `image/` directory without editing their contents.
- `../../llvm/memberB/`: the hand-written LLVM IR for the team's shared SysY
  program, with a reproducible Makefile and three shared test cases.

The q1/artifacts/build-linux/ directory preserves text outputs from the
original run, including preprocessed source, tokens, AST, LLVM IR, assembly,
GCC CFG dumps, pass logs, and link/disassembly observations. Generated object
and executable binaries are intentionally not added.

The prework screenshots document Clang/LLVM 14 and GCC inside Ubuntu 22.04
Docker. The C pipeline source is intentionally kept separate from the shared
SysY source: the first task observes a compiler pipeline, while the second
implements the team's `main.sy` semantics in LLVM IR.
