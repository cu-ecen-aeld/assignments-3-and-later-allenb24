#include <stdio.h>
#include <stdlib.h>
#include <syslog.h>

int main(int argc, char* argv[]) {
    // Open connection to the system logger
    openlog(NULL, LOG_PID, LOG_USER);   // Print out the PID with each name (better for debugging) and user-level messages
    
    // Need argc to be 3, where argv[0] is program name, argv[1] is path to file, argv[2] is text to write
    if (argc != 3) {
        syslog(LOG_ERR, "Error: Incorrect # of arguments(%d), expected 3.", argc);    // Print error-level messages
        fprintf(stderr, "ERROR: Acceptable arguments: <FILE_PATH> <STRING>\n");
        exit(1);
    }

    // Open file
    FILE* file = fopen(argv[1], "r+");
    if (file == NULL) {
        syslog(LOG_ERR, "Error: Unable to open %s\n", argv[1]);    // Print error-level messages
        fprintf(stderr, "ERROR: Unable to open %s\n", argv[1]);
        exit(1);
    }

    // Write to file
    fprintf(file, "%s\n", argv[2]);
    syslog(LOG_DEBUG, "Writing %s to %s\n", argv[2], argv[1]);

    // Close file
    fclose(file);
    syslog(LOG_DEBUG, "Closed file\n");

    return 0;
}
