#include "doctest.hpp"
#include "lib.hpp"
#include <ostream>
#include <string>

std::string hello(std::string name) { return "Hello, " + name + "!"; }

TEST_CASE("hello() works properly") {
	CHECK(hello("World") == "Hello, World!");
	CHECK(hello("Boris") == "Hello, Boris!");
}
