#ifndef TEST_H
#define TEST_H

//宏
#define N 20

//带参宏
#define mul(a,b) ((a)*(b))

//条件编译
#ifdef DEBUG
#define debug(x) cout << x << endl
#else
#define debug(x)
#endif

#endif