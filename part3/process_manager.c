#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

void child_process(char *cmd, char *args[]) {
    execv(cmd, args);
    perror("execv failed"); 
    exit(1);
}

int main() {
    pid_t pid1, pid2;

    // Creating first child process
    pid1 = fork();
    if (pid1 == 0) {
        // Child 1 executes "mpstat"
        char *args1[] = { "mpstat", "2", "2"};
        child_process("/usr/bin/mpstat", args1);
    }

    // Creating second child process
    pid2 = fork();
    if (pid2 == 0) {
        // Child 2 executes "ps aux"
        char *args2[] = { "ps", "aux"};
        child_process("/bin/ps", args2);
    }

    // Parent process waits for both children to finish
    wait(NULL);
    wait(NULL);

    printf("Parent: Both worker processes completed.\n");
    return 0;
}

