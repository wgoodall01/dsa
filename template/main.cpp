#include <stdio.h>
#include <iostream>
#include <sstream>
#include <string>

using namespace std;

string greet(string name){
	ostringstream ss;
	ss << "Hello, " << name << "!";
	return ss.str();
}

int main(int argc, char *argv[]){
	std::cout << greet("World") << endl;
	return 0;
}
