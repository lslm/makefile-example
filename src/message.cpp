#include <iostream>
#include "message.h"

using namespace std;

void Message::printMessage(string name) {
  printf("Hello, %s!\n", name.c_str());
}