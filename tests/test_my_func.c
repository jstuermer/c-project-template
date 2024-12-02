#include <CUnit/Basic.h>
#include <CUnit/CUnit.h>

#include "my_func.h"

void test_my_func(void) {
  // test
  CU_ASSERT(my_func() == 2);
}

int main() {
  CU_initialize_registry();
  CU_pSuite suite = CU_add_suite("AddTestSuite", 0, 0);
  CU_add_test(suite, "test of my_func()", test_my_func);
  CU_basic_run_tests();
  CU_cleanup_registry();
  return 0;
}