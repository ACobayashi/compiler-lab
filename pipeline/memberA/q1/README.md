# 成员A：了解编译器

主流程为 C17 / Clang / LLVM；GCC 仅辅助导出 Tree/GIMPLE CFG，交叉 GCC 驱动另负责调用 AArch64 汇编器与链接器。这些辅助工具的输出仍属于成员A的实验。

## 文件

- `src/main.c`、`include/config.h`、`input/sample.txt`：源程序、宏和样例输入；与旧预备实验目录逐字节一致。
- `build-linux/`：从 `prework-1-compiler-pipeline/build-linux/` 完整导入的 Linux 阶段产物，保留原始内容与文件名。
- `reference/previous-artifacts/`：原仓库部分归档中不同的 `ast.txt` 和 `main-O0-ubuntu.ll`；保留旧版本作参考，不作为当前产物入口。原 `artifacts/build-linux/` 的其他文件与完整导入版本逐字节一致，已合并，避免重复目录。

| 文件或目录 | 阶段 / 工具 |
| --- | --- |
| `main.i` | Clang 预处理 |
| `tokens.txt`、`ast.txt` | Clang 前端词法与 AST |
| `main-O0-ubuntu.ll`、`main-O2-ubuntu.ll` | Clang 输出的 x86-64 Linux LLVM IR |
| `main-O0-ubuntu.s`、`main-O2-ubuntu.s` | x86-64 Linux 汇编 |
| `main-O2-aarch64.ll`、`main-O2-aarch64.s` | AArch64 LLVM IR 与汇编 |
| `llc-passes.log`、`llc-o2-passes.log` | LLVM 后端 pass 前后的 dump |
| `main-O2-aarch64.o`、`main-aarch64` | AArch64 可重定位目标文件与可执行文件 |
| `gcc-graphs/` | GCC 辅助 CFG 与其他 Tree/GIMPLE 图；Graphviz 绘图 |
| `link-check/` | 链接前后反汇编记录 |

环境为 Ubuntu 22.04 / Clang、LLVM 14；AArch64 产物需要相应交叉工具链和 QEMU，不能当作 x86-64 或 macOS 可执行文件直接运行。

报告中的手工命令从本目录执行，输入路径为 `src/`、`include/`、`input/`，保存路径为 `build-linux/`。目录迁移不代表重新运行实验；文件内部的原始源码路径与 pass dump 保持不变。

旧 `prework-1-compiler-pipeline` 已保留，不在本次整理中删除。
