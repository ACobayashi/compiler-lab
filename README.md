# 编译原理实验

本仓库保存两人完成的编译原理上机实验材料和最终报告。

## 实验内容

- 小题1：成员A使用 C17/Clang/LLVM，成员B使用 C++/GCC，分别观察预处理、前端分析、中间表示、汇编、目标文件和链接结果。
- 小题2：以同一份 SysY 程序为基准，完成 LLVM IR 和 RV64 RISC-V 汇编实现，并链接 SysY 运行时库测试。
- 进阶部分：使用 MLIR 14 观察矩阵乘法从 `linalg.matmul` 经循环、控制流、LLVM Dialect 到标准 LLVM IR 和目标文件的 Lowering 过程。

## 成员分工

- 林子媛（2410936，成员A）：C17/Clang/LLVM 编译流程、LLVM IR、MLIR 高层表示与循环 Lowering。
- 王麒萱（2412096，成员B）：C++/GCC 编译流程、RISC-V 汇编、MLIR 控制流、LLVM IR 与目标文件核对。
- 两人共同：SysY 程序和基础测试数据、报告整理、结果核对。

## 目录

- `report/`：最终 LaTeX 报告工程。
- `编译原理实验1.docx`：最终 Word 实验报告。
- `main.cpp`、`test.h`、`main_error.cpp`、`output/`：成员B的 GCC 实验代码和保存的阶段产物。
- `pipeline/memberA/`、`llvm/memberA/`：成员A的 C17/Clang/LLVM 实验材料和 LLVM IR 实现。
- `report/figures/memberA/q1/`、`report/figures/memberB/q1/`：分别保存成员A的 Clang/LLVM 及成员B的 GCC 实验截图。
- `riscv/`：共享 SysY 程序、RISC-V 汇编、运行时库和 100 组测试记录。
- `mlir/`：MLIR 进阶实验的输入与各阶段文本产物。

## 已验证结果

- LLVM native 与 `lli` 的三组统一测试均通过。
- RISC-V 三组基础测试和 100 组扩展测试均通过。
- `mlir/matmul.ll` 可使用 Clang 生成导出 `matmul` 符号的 x86-64 目标文件。
