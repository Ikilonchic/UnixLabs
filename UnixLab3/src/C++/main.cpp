#include <iostream>

using namespace std;

double Mltp(const double first, const double second) {
    return first * second;
}

int main(int argc, const char** argv) {
    if (argc < 3) {
        std::cout << "Not enough args!" << std::endl;
        return EXIT_SUCCESS;
    }

    char* error;
    const auto first  = strtod(argv[1], &error);
    const auto second = strtod(argv[2], &error);


    if (*error != 0 && !isspace((unsigned char)*error)) {
        std::cout <<  "Parse error..." << std::endl;
        return EXIT_FAILURE;
    }

    std::cout << first << " * " << second << " = " << Mltp(first, second) << std::endl;
    return EXIT_SUCCESS;
}
