%option noyywrap

%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char date[20] = "";
char name[50] = "";
int bsf = 0;
int bspp = 0;
float hba1c = 0.0;

int current_test = 0;
int patient_no = 0;

char *classify_bsf(int x)
{
    if (x < 56)
        return "VL";
    else if (x < 66)
        return "L";
    else if (x <= 116)
        return "N";
    else if (x <= 132)
        return "H";
    else
        return "VH";
}

char *classify_bspp(int x)
{
    if (x < 56)
        return "VL";
    else if (x < 67)
        return "L";
    else if (x <= 147)
        return "N";
    else if (x <= 168)
        return "H";
    else
        return "VH";
}

char *classify_hba1c(float x)
{
    if (x < 3.2)
        return "VL";
    else if (x < 3.8)
        return "L";
    else if (x <= 6.3)
        return "N";
    else if (x <= 7.2)
        return "H";
    else
        return "VH";
}

void print_record()
{
    patient_no++;

    printf("%-4d %-12s %-10s %-7d %-7d %-7.1f %-3s %-3s %-3s\n",
           patient_no,
           date,
           name,
           bsf,
           bspp,
           hba1c,
           classify_bsf(bsf),
           classify_bspp(bspp),
           classify_hba1c(hba1c));

    date[0] = '\0';
    name[0] = '\0';
    bsf = 0;
    bspp = 0;
    hba1c = 0.0;
    current_test = 0;
}
%}

%%

(0[1-9]|[12][0-9]|3[01])-(0[1-9]|1[0-2])-[0-9]{4} {
    strcpy(date, yytext);
}

"BS(F)" {
    current_test = 1;
}

"BS(PP)" {
    current_test = 2;
}

"HBA1C" {
    current_test = 3;
}

[A-Z][a-z]+ {
    strcpy(name, yytext);
}

[0-9]+\.[0-9]+ {
    if (current_test == 3) {
        hba1c = atof(yytext);
        current_test = 0;
    }
}

[0-9]+ {
    if (current_test == 1) {
        bsf = atoi(yytext);
        current_test = 0;
    }
    else if (current_test == 2) {
        bspp = atoi(yytext);
        current_test = 0;
    }
}

[ \t]+ {
}

\n {
    if (date[0] != '\0' && name[0] != '\0')
        print_record();
}

. {
}

%%

int main()
{
    printf("Patient Test Date Name BS(F) BS(PP) HBA1C F PP HBA1C\n");
    yylex();
    return 0;
}
