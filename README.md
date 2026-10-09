# 编译原理实验

本仓库按实验内容和成员分工保存源码、阶段产物、测试记录及 LaTeX 报告。

## 实验内容

- 小题1：成员A使用 C17/Clang/LLVM，成员B使用 C++/GCC，分别观察预处理、前端分析、中间表示、汇编、目标文件和链接结果。
- 小题2：以同一份 SysY 程序为基准，完成 LLVM IR 和 RV64 RISC-V 汇编实现，并链接 SysY 运行时库测试。
- 进阶部分：使用 MLIR 14 观察矩阵乘法从 `linalg.matmul` 经循环、控制流、LLVM Dialect 到标准 LLVM IR 和目标文件的 Lowering 过程。

## 成员分工

- 林子媛（2410936，成员A）：C17/Clang/LLVM 编译流程、LLVM IR、MLIR 高层表示与循环 Lowering。
- 王麒萱（2412096，成员B）：C++/GCC 编译流程、RISC-V 汇编、MLIR 控制流、LLVM IR 与目标文件核对。
- 两人共同：SysY 程序和基础测试数据、报告整理、结果核对。

## 目录与归属

```text
pipeline/
  memberA/q1/
    src/                  # A: C17 source
    include/              # A: macros and declarations
    input/                # A: sample input
    build-linux/          # A: saved Clang/LLVM pipeline artifacts
    reference/            # distinct files from the previous partial archive
  memberB/q1/
    main.cpp              # B: GCC C++ factorial example
    main_error.cpp
    test.h
    output/               # B: saved GCC pipeline artifacts
llvm/memberA/
  src/handwritten.ll      # A: current hand-written LLVM IR
  reference/              # generated reference IR and previous repository version
  build-linux/            # A: saved bitcode, objects, executables and runtime .so
  results/                # A: source/native/lli stdout and stderr
  tests/                  # input and expected output
  Makefile                # rebuild into build/, without overwriting saved artifacts
riscv/memberB/
  main.s                  # B: hand-written RISC-V assembly
  test_results_100.md     # B: extended test record
shared/sysy/
  main.sy                 # shared semantic baseline
  lib/                    # runtime source and RISC-V libraries
  lib_official/           # original runtime package
report/
  main.tex
  main.pdf
  figures/memberA/        # A: q1 and LLVM IR screenshots
  figures/memberB/        # B: q1 and RISC-V screenshots
  legacy/                 # previous Word report
mlir/                     # shared advanced experiment
```

### 成员归属与历史材料

- 成员A负责 Clang/LLVM 编译流程与 LLVM IR 编程。本次未提交的手工复现、截图补充和目录整理均由成员A完成。
- 成员B负责 GCC 编译流程与 RISC-V 汇编编程。原仓库根目录的 C++ 示例及 `output/` 已移入 `pipeline/memberB/q1/`。
- `pipeline/memberA/q1/build-linux/gcc-graphs/` 仍归成员A：这是成员A用 GCC 辅助观察 CFG 的产物，不是成员B的实验，也不改变 A 的 Clang/LLVM 主流程。
- A 的编译流程产物来自原 `prework-1-compiler-pipeline/build-linux/`，复制时保留内容与文件名，旧目录未删除。
- 原 `pipeline/memberA/q1/artifacts/build-linux/` 的相同文件合并到上述归档；不同的旧 AST 和 IR 保存在 `reference/previous-artifacts/`，不与当前产物混放。
- 原 `llvm/memberA/practice/` 已按用途拆分，不再作为实验目录。迁移前已有的 `main.ll` 保存在 `llvm/memberA/reference/previous-main.ll`，当前手写版本以 `src/handwritten.ll` 为准。
- 截图和生成 IR 中的旧路径是生成时的历史记录，不改写截图或生成文件。当前可复现路径以各目录的 README 和 Makefile 为准。
- `report/main.tex` / `report/main.pdf` 是当前报告；`report/legacy/` 中的 Word 文件仅作为历史版本保留。

## LLVM IR 复现

在 Ubuntu 22.04、LLVM/Clang 14 的 `linux/amd64` 环境中执行：

```sh
cd llvm/memberA
make all
make test
```

构建输出写入被忽略的 `build/`；已验证的 `build-linux/` 和 `results/` 不被重建或 `make clean` 覆盖。详细命令与文件映射见 `llvm/memberA/README.md`。

## 已验证结果

- LLVM native 与 `lli` 的三组统一测试均通过。
- RISC-V 三组基础测试和 100 组扩展测试均通过。
- `mlir/matmul.ll` 可使用 Clang 生成导出 `matmul` 符号的 x86-64 目标文件。
