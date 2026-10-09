# 成员A：LLVM IR 编程

本次从共享 SysY 源程序出发，生成 Clang 参考 IR，再手写等价 IR，并用本机可执行文件与 `lli` 检验。环境为 macOS 宿主机上的 `linux/amd64` Docker / Ubuntu 22.04 / LLVM、Clang 14。

## 源码与证据

| 目录 | 内容 |
| --- | --- |
| `src/handwritten.ll` | 本次成员A手写的完整程序：`sum_even`、`count_pos`、`main` |
| `reference/reference.c` | C 兼容包装：声明运行库函数并包含共享 SysY 源码 |
| `reference/reference.ll` | Clang `-O0` 参考 IR |
| `reference/reference.promotable.ll` | 去掉 `optnone` 后、允许指定优化的参考 IR |
| `reference/reference.ssa.ll` | `mem2reg` 后的 SSA / `phi` 参考 IR |
| `reference/previous-main.ll` | 迁移前仓库已有的 IR，保留作历史对照，不作为本次手写入口 |
| `build-linux/` | 原手工实验生成的 `.bc`、`.o`、本机程序与运行库 `.so` |
| `results/` | 三组输入的源程序 / native / lli 标准输出和标准错误 |
| `tests/` | 共用输入及预期输出 |

原 `practice/` 已拆分：手写源码移至 `src/`，参考资料移至 `reference/`，编译产物移至 `build-linux/`，测试记录移至 `results/`。截图和自动生成 IR 的 ModuleID / source_filename 保留当时的 `practice` 路径，以免伪造历史证据。

## 当前路径下的手工命令

在仓库根目录、Ubuntu 容器内执行：

```sh
clang-14 -O0 llvm/memberA/reference/reference.c shared/sysy/lib/sylib.c -o llvm/memberA/build-linux/source-native
llvm-as-14 llvm/memberA/src/handwritten.ll -o llvm/memberA/build-linux/handwritten.bc
clang-14 -c -x ir llvm/memberA/src/handwritten.ll -o llvm/memberA/build-linux/handwritten.o
clang-14 -c shared/sysy/lib/sylib.c -o llvm/memberA/build-linux/sylib.o
clang-14 llvm/memberA/build-linux/handwritten.o llvm/memberA/build-linux/sylib.o -o llvm/memberA/build-linux/ir-native
clang-14 -shared -fPIC shared/sysy/lib/sylib.c -o llvm/memberA/build-linux/sylib.so
./llvm/memberA/build-linux/ir-native < llvm/memberA/tests/case1.in
lli-14 -load=llvm/memberA/build-linux/sylib.so llvm/memberA/build-linux/handwritten.bc < llvm/memberA/tests/case1.in
```

上述命令会覆盖相应产物。若希望保留历史记录不变，优先使用以下 Makefile，在单独的 `build/` 中复现：

```sh
cd llvm/memberA
make all
make reference-ir
make test
```

`make test` 对比预期输出、C 兼容源程序基线、IR 本机程序与 `lli` 的 stdout。stderr 单独保存，SysY 运行库的 `TOTAL` 计时行不参与结果比较。

已保存的三组结果为 `12/4`、`6/2`、`0/5`，三种方式一致。输入须满足 `0 <= n <= 10`，累计和不发生有符号溢出；数组长度并未在程序中自动检查。
