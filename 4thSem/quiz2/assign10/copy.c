#include <stdio.h>
#include <fcntl.h>
#include <unistd.h>

int main() {
    int src, dest;
    char buffer[100];
    int bytes;

    // 1. Open source file (read only)
    src = open("source.txt", O_RDONLY);
    if (src < 0) {
        printf("Error opening source file\n");
        return 1;
    }

    // 2. Open/create destination file
    dest = open("dest.txt", O_WRONLY | O_CREAT | O_TRUNC, 0644);
    if (dest < 0) {
        printf("Error opening destination file\n");
        return 1;
    }

    // 3. Read from source and write to destination
    while ((bytes = read(src, buffer, sizeof(buffer))) > 0) {
        write(dest, buffer, bytes);
    }

    // 4. Close files
    close(src);
    close(dest);

    printf("File copied successfully!\n");

    return 0;
}
