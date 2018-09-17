#define CATCH_CONFIG_MAIN
#include "catch.hpp"

#include "lib.h"
#include <iostream>



TEST_CASE("formats 'hello world' correctly"){
	REQUIRE(hello("World") == "Hello, World!");
	REQUIRE(hello("Derek") == "Hello, Derek!");
}
