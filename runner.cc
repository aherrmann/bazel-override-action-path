#include <cstdlib>
#include <iostream>
#include <fstream>

int main(int argc, char **argv) {
        if (const char *path = std::getenv("PATH")) {
                if (argc > 1) {
                        std::ofstream f(argv[1]);
                        f << "PATH: " << path << "\n";
                } else {
                        std::cout << "PATH: " << path << "\n";
                }
        } else {
                return 1;
        }
}
