# 编译原理上机作业

本仓库用于两人协作完成“编译原理上机作业”。现有实验材料按最小改动原则整理，保留成员 A 已完成的小题 1 与 RISC-V 实验结果。

## 内容

1. 小题 1：GCC 完整语言处理流程实验
2. SysY 示例程序
3. LLVM IR 等价实现（成员 B 待完成）
4. RISC-V 等价实现
5. LaTeX 双人实验报告

## 分工

| 成员 | 工作 |
| --- | --- |
| 成员 A | 小题 1 独立实验；RISC-V；RISC-V SysY runtime 链接与测试 |
| 成员 B | 小题 1 独立实验；LLVM IR；LLVM SysY runtime 链接与测试 |
| 共同 | SysY 示例程序；报告框架；摘要；引言；结论；最终检查 |

## 目录

- `main.cpp`、`test.h`：小题 1 的 C++ 基准程序与自定义头文件。
- `output/`：小题 1 的预处理、token、GCC tree/CFG/RTL、汇编、反汇编和优化报告等已有实验输出。
- `riscv/main.sy`：两人共同使用的 SysY 语义基准。
- `riscv/main.s`：成员 A 手写的 RV64 汇编实现。
- `riscv/lib/`：SysY RISC-V 运行时库及必要源文件。
- `report/`：双人合并 LaTeX 报告工程与当前 PDF。
- `image/`：已有实验图片材料。

## 协作说明

成员 B 请重点编辑：

- `report/sections/q1_memberB.tex`
- `report/sections/q2_llvm.tex`
- `report/figures/memberB/q1/`
- `report/figures/shared/q2_llvm/`

LLVM IR 必须以 `riscv/main.sy` 为同一语义基准，不得重新设计另一份 SysY 程序。成员 B 的小题 1 和 LLVM IR 目前保留 TODO 占位，不应编造命令、结果或图片。

## 已验证的 RISC-V 测试

使用课程 RISC-V 工具链、`libsysy_riscv.a` 和 QEMU 运行：

| 输入编号 | 偶数和 | 正数个数 |
| --- | ---: | ---: |
| 1 | 12 | 4 |
| 2 | 6 | 2 |
| 3 | 0 | 5 |

`main.sy` 的数组容量为 10；测试输入应满足 `0 <= n <= 10`。
