#include "gtest/gtest.h"
#include "hello.h"

TEST( HelloTest, testSayHello ) {
	EXPECT_EQ ( sayHello(), "Hello Bazel!" );
}
