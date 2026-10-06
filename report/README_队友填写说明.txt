这是小组共享的 LaTeX 报告和实验代码。成员A的已有实验材料保持原样；成员B的第一题源程序与第二题 LLVM IR 放在 pipeline/memberB/ 和 llvm/memberB/。

成员A已经填好：
1. 自己的小题1（GCC/Clang完整语言处理流程）及原实验截图；
2. 共同 SysY 示例程序；
3. 小题2 RISC-V 部分、链接过程、3组测试和运行时库验证。

成员B已完成：
1. sections/q1_memberB.tex —— 独立完成的小题1；
2. sections/q2_llvm.tex —— 基于报告同一份 SysY 程序的手写 LLVM IR、运行时链接和三组测试；
3. figures/memberB/q1/ —— 从预备作业 image/ 目录复制的小题1截图；
4. llvm/memberB/ —— main.ll、Makefile 和三组测试输入；
5. pipeline/memberB/q1/ —— 第一题源文件、配置头文件和样例输入。

目前 image/ 中没有小题2运行截图；报告以实际可重复的命令和测试表记录结果，没有伪造截图。AST 截图有终端窗口重叠，正式提交前建议成员B重截。config.tex 中成员姓名、学号、班级仍须由两位成员填写，不能由本报告代填。

两个人共同填写：
config.tex 中姓名、学号、班级和日期。

编译：
在本目录执行 xelatex main.tex 两次即可。字体和 lastpage 宏包均提供回退设置；若缺少报告其他 TeX 宏包，请按编译错误安装相应 TeX Live 宏包。

验证 LLVM IR（要求 LLVM/Clang 14 环境）：
在仓库根目录执行 cd llvm/memberB && make test。构建产物保存在 llvm/memberB/build/，该目录已忽略，不会提交二进制文件。
