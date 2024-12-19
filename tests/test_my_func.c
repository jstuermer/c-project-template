#include <project/my_func.h>
#include <stdbool.h>

#define CLOVE_SUITE_NAME MyLibTestSuite
#include "clove-unit.h"

CLOVE_TEST(MyFuncTest) {
  int expected_value = 2;
  CLOVE_INT_EQ(my_func(), 2);
}
