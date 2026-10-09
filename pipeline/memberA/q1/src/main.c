#include <stdio.h>

#include "config.h"

const int global_bias = 2;
int processed_items = 0;

int weighted_sum(const int values[], int count)
{
    int total = 0;

    for (int i = 0; i < count; ++i)
    {
        int adjusted = ADJUST(values[i], global_bias);
        if (adjusted % 2 == 0)
        {
            total += adjusted;
        }
        else
        {
            total -= adjusted;
        }
        ++processed_items;
    }

    return total;
}

int main(void)
{
    int count = 0;
    int values[MAX_ITEMS] = {0};

    if (scanf("%d", &count) != 1 || count < 1 || count > MAX_ITEMS)
    {
        return 1;
    }

    for (int i = 0; i < count; ++i)
    {
        if (scanf("%d", &values[i]) != 1)
        {
            return 1;
        }
    }

    int result = weighted_sum(values, count);
    printf("result=%d, processed=%d\n", result, processed_items);
    return 0;
}
