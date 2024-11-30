#include "iostream"
#include <sys/wait.h>

int main() {
    pid_t PID = fork();

    if (PID == 0) { 
        std::cout << "Terminating the Child Process...\n";
        exit(1);
    }
    else if (PID > 0) {
        std::cout << "Parent Process Waitting...\n";
        /** wait(NULL); no waitting **/
        while(1) {}; // doing no thing
        /** Child became a Zombie **/
    }
    else {
        std::cout << "Fork Faild\n";
        return 1;
    }
    return 0;
}