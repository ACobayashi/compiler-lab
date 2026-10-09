# 成员B：GCC 编译流程

原仓库根目录的 GCC 实验材料迁移到此处，内容未改动：

- `main.cpp`：C++ 阶乘示例。
- `test.h`：宏与条件编译配置。
- `main_error.cpp`：类型诊断示例。
- `output/`：已保存的预处理、Tree/GIMPLE、RTL、汇编及其他阶段输出。

从本目录执行报告中的 `g++` 命令，原来的 `main.cpp` 与 `output/...` 相对路径继续有效。

成员B的 RISC-V 汇编编程材料另在 `riscv/memberB/`，不与成员A的 LLVM IR 编程混放。
