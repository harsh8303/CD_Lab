%option noyywrap

%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int executable_count = 0;

long long largest_size = -1;
long long smallest_size = -1;

char largest_name[256] = "";
char smallest_name[256] = "";

char inaccessible[100][256];
int inaccessible_count = 0;

char oldest_name[256] = "";
char latest_name[256] = "";

int oldest_month = 0, oldest_day = 0, oldest_hour = 0, oldest_minute = 0;
int latest_month = 0, latest_day = 0, latest_hour = 0, latest_minute = 0;

int month_number(char *m)
{
    if (!strcmp(m, "Jan")) return 1;
    if (!strcmp(m, "Feb")) return 2;
    if (!strcmp(m, "Mar")) return 3;
    if (!strcmp(m, "Apr")) return 4;
    if (!strcmp(m, "May")) return 5;
    if (!strcmp(m, "Jun")) return 6;
    if (!strcmp(m, "Jul")) return 7;
    if (!strcmp(m, "Aug")) return 8;
    if (!strcmp(m, "Sep")) return 9;
    if (!strcmp(m, "Oct")) return 10;
    if (!strcmp(m, "Nov")) return 11;
    if (!strcmp(m, "Dec")) return 12;

    return 0;
}

void process_record(char *perm, long long size, char *month, int day,
                    char *time, char *name)
{
    int mon;
    int hour, minute;

    mon = month_number(month);
    sscanf(time, "%d:%d", &hour, &minute);

    if (perm[0] == '-' && perm[3] == 'x')
        executable_count++;

    if (largest_size == -1 || size > largest_size)
    {
        largest_size = size;
        strcpy(largest_name, name);
    }

    if (smallest_size == -1 || size < smallest_size)
    {
        smallest_size = size;
        strcpy(smallest_name, name);
    }

    if (perm[7] == '-' && perm[8] == '-' && perm[9] == '-')
    {
        strcpy(inaccessible[inaccessible_count], name);
        inaccessible_count++;
    }

    if (oldest_month == 0 ||
        mon < oldest_month ||
        (mon == oldest_month && day < oldest_day) ||
        (mon == oldest_month && day == oldest_day && hour < oldest_hour) ||
        (mon == oldest_month && day == oldest_day &&
         hour == oldest_hour && minute < oldest_minute))
    {
        oldest_month = mon;
        oldest_day = day;
        oldest_hour = hour;
        oldest_minute = minute;
        strcpy(oldest_name, name);
    }

    if (latest_month == 0 ||
        mon > latest_month ||
        (mon == latest_month && day > latest_day) ||
        (mon == latest_month && day == latest_day && hour > latest_hour) ||
        (mon == latest_month && day == latest_day &&
         hour == latest_hour && minute > latest_minute))
    {
        latest_month = mon;
        latest_day = day;
        latest_hour = hour;
        latest_minute = minute;
        strcpy(latest_name, name);
    }
}
%}

%%

^[ \t]*total[ \t]+[0-9]+ {
}

^[ \t]*[0-9]+[ \t]+([d-][rwx-]{9})[ \t]+[0-9]+[ \t]+[^ \t]+[ \t]+[^ \t]+[ \t]+[0-9]+[ \t]+(Jan|Feb|Mar|Apr|May|Jun|Jul|Aug|Sep|Oct|Nov|Dec)[ \t]+[0-9]+[ \t]+[0-9]{2}:[0-9]{2}[ \t]+[^ \t\n]+ {
    char line[1024];
    char perm[20];
    char month[10];
    char time[10];
    char name[256];
    long long blocks;
    long long size;
    int links;
    int day;

    strcpy(line, yytext);

    sscanf(line, "%lld %s %d %*s %*s %lld %s %d %s %255s",
           &blocks, perm, &links, &size, month, &day, time, name);

    process_record(perm, size, month, day, time, name);
}

[ \t\r\n]+ {
}

. {
}

%%

int main()
{
    yylex();

    printf("\nProblem 3 Results\n\n");

    printf("Number of executable files : %d\n", executable_count);

    printf("Largest resource : %s (%lld bytes)\n",
           largest_name, largest_size);

    printf("Smallest resource : %s (%lld bytes)\n",
           smallest_name, smallest_size);

    printf("Resources not accessible to other users:\n");

    if (inaccessible_count == 0)
        printf("None\n");
    else
    {
        int i;
        for (i = 0; i < inaccessible_count; i++)
            printf("%s\n", inaccessible[i]);
    }

    printf("Oldest resource : %s\n", oldest_name);
    printf("Most recent resource : %s\n", latest_name);

    return 0;
}
