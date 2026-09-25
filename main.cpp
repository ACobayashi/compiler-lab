//头文件
#include <iostream>
//自定义头文件
#include "test.h"
using namespace std;

//全局变量
int times = 0;
//全局常量
const int start = 2;

//函数
long long factorial(int n)
{
    //局部变量
    long long result = 1;

    //循环
    for (int i = start; i <= n; i++)
        //运算、赋值、宏
        result = mul(result, i);
    times++;
    return result;
}

int main()
{
    int n;

    //输入
    cin >> n;
    //条件、逻辑运算
    if (n < 0 || n > N)
        return 0;
    //条件编译
    debug(n);
    //函数调用、输出
    cout << factorial(n) << endl;
    cout << times << endl;

    return 0;
}