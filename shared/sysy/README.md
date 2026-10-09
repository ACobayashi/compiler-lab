# 共享 SysY 程序与运行库

本目录是成员A的 LLVM IR 与成员B的 RISC-V 汇编的共同语义基准，不归属于某一方的编译产物。

- `main.sy`：求偶数和、统计正数数量的 SysY 程序。
- `lib/sylib.c`、`lib/sylib.h`：运行库源码。LLVM IR 的本机目标文件和 `lli` 共享库均从这份源码构建。
- `lib/libsysy_rv.a`、`lib/libsysy_riscv.a`：保留的 RISC-V 运行库。
- `lib_official/`：原课程运行库包，保留架构区分和原文件内容。

这些文件原来位于 `riscv/` 根目录。放入共享目录是为了避免将 LLVM IR 所用的输入与运行库误认为成员B独有的材料。

使用预编译库前须核对目标架构；不要将 RISC-V 或 Linux x86 库直接链接到 macOS arm64 程序。
