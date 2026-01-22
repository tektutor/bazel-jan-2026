#include "gtest/gtest.h"
#include "hello.h"

TEST(TestHello, testSayHello) {
	EXPECT_EQ( sayHello(), "Hello Bazel");
}

