#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/wait.h>

#define MAX 100

struct Contact {
    char name[50];
    char phone[20];
};


void sortContacts(struct Contact c[], int n) {
    struct Contact temp;
    for(int i = 0; i < n - 1; i++) {
        for(int j = i + 1; j < n; j++) {
            if(strcmp(c[i].name, c[j].name) > 0) {
                temp = c[i];
                c[i] = c[j];
                c[j] = temp;
            }
        }
    }
}

int main() {
    FILE *fp;
    struct Contact contacts[MAX];
    int n = 0;

    printf("Parent Process PID: %d\n", getpid());


    fp = fopen("phonebook", "w");
    if(fp == NULL) {
        perror("File creation failed");
        exit(1);
    }

    fprintf(fp, "rajiv 9876543210\n");
    fprintf(fp, "rohit 918051568658\n");
    fprintf(fp, "aditya 9988776655\n");
    fprintf(fp, "prithvi 9090909090\n");

    fclose(fp);


    pid_t pid1 = fork();

    if(pid1 == 0) {
        printf("\nChild 1 PID: %d, Parent PID: %d\n", getpid(), getppid());

        FILE *fp1 = fopen("phonebook", "r");
        FILE *fp2 = fopen("sorted.txt", "w");

        if(fp1 == NULL || fp2 == NULL) {
            perror("File error");
            exit(1);
        }

        int count = 0;

        while(fscanf(fp1, "%s %s", contacts[count].name, contacts[count].phone) != EOF) {
            count++;
        }

        sortContacts(contacts, count);

        for(int i = 0; i < count; i++) {
            fprintf(fp2, "%s %s\n", contacts[i].name, contacts[i].phone);
        }

        fclose(fp1);
        fclose(fp2);

        printf("Child 1: Sorting completed → sorted.txt created\n");
        exit(0);
    }

    wait(NULL);


    pid_t pid2 = fork();

    if(pid2 == 0) {
        printf("\nChild 2 PID: %d, Parent PID: %d\n", getpid(), getppid());

        char searchName[50];
        char name[50], phone[20];
        int found = 0;

        printf("Enter name to search: ");
        scanf("%s", searchName);

        FILE *fp3 = fopen("sorted.txt", "r");
        if(fp3 == NULL) {
            perror("File open error");
            exit(1);
        }

        while(fscanf(fp3, "%s %s", name, phone) != EOF) {
            if(strcmp(name, searchName) == 0) {
                printf("Phone number of %s is %s\n", name, phone);
                found = 1;
                break;
            }
        }

        if(!found) {
            printf("Name not found!\n");
        }

        fclose(fp3);
        exit(0);
    }

    wait(NULL); // wait for child 2

    printf("\nParent Process Finished (PID: %d)\n", getpid());

    return 0;
}
