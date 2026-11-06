%option noyywrap

%{
#include <stdio.h>
#include <string.h>

int keywords = 0;
int identifiers = 0;
int integers = 0;
int assign_ops = 0;
int arithmetic_ops = 0;
int relational_ops = 0;
int left_par = 0;
int right_par = 0;
int delimiters = 0;
int comments = 0;
int char_literals = 0;
int string_literals = 0;

int is_keyword(char *s)
{
    return !strcmp(s, "auto") ||
           !strcmp(s, "break") ||
           !strcmp(s, "case") ||
           !strcmp(s, "char") ||
           !strcmp(s, "const") ||
           !strcmp(s, "continue") ||
           !strcmp(s, "default") ||
           !strcmp(s, "do") ||
           !strcmp(s, "double") ||
           !strcmp(s, "else") ||
           !strcmp(s, "enum") ||
           !strcmp(s, "extern") ||
           !strcmp(s, "float") ||
           !strcmp(s, "for") ||
           !strcmp(s, "goto") ||
           !strcmp(s, "if") ||
           !strcmp(s, "int") ||
           !strcmp(s, "long") ||
           !strcmp(s, "register") ||
           !strcmp(s, "return") ||
           !strcmp(s, "short") ||
           !strcmp(s, "signed") ||
           !strcmp(s, "sizeof") ||
           !strcmp(s, "static") ||
           !strcmp(s, "struct") ||
           !strcmp(s, "switch") ||
           !strcmp(s, "typedef") ||
           !strcmp(s, "union") ||
           !strcmp(s, "unsigned") ||
           !strcmp(s, "void") ||
           !strcmp(s, "volatile") ||
           !strcmp(s, "while");
}
%}

%%

^[ \t]*#[^\n]* {
    printf("pre-processor directive ignored : %s\n", yytext);
}

"//"[^\n]* {
    comments++;
    printf("Single Line Comment = \"%s\"\n", yytext);
}

\"([^\"\\]|\\.)*\" {
    string_literals++;
    printf("(Token, Lexeme) = (STRING, %s)\n", yytext);
}

\'([^\'\\]|\\.)\' {
    char_literals++;
    printf("(Token, Lexeme) = (CHAR LITERAL, %s)\n", yytext);
}

0[xX][0-9a-fA-F]+ {
    printf("(Token, Lexeme) = (HEXA NUMBER, %s)\n", yytext);
}

[0-9]+ {
    integers++;
    printf("(Token, Lexeme) = (INTEGER, %s)\n", yytext);
}

[a-zA-Z_][a-zA-Z0-9_]* {
    if (is_keyword(yytext)) {
        keywords++;
        printf("(Token, Lexeme) = (KEYWORD, %s)\n", yytext);
    }
    else {
        identifiers++;
        printf("(Token, Lexeme) = (IDENTIFIER, %s)\n", yytext);
    }
}

"=" {
    assign_ops++;
    printf("(Token, Lexeme) = (ASSIGN-OP, '=')\n");
}

"<="|">="|"=="|"!="|"<"|">" {
    relational_ops++;
    printf("(Token, Lexeme) = (RELOP, '%s')\n", yytext);
}

"+"|"-"|"*"|"/"|"%" {
    arithmetic_ops++;
    printf("(Token, Lexeme) = (ARITH-OP, '%s')\n", yytext);
}

"(" {
    left_par++;
    printf("(Token, Lexeme) = (LEFTPAR, '(')\n");
}

"{" {
    left_par++;
    printf("(Token, Lexeme) = (LEFTPAR, '{')\n");
}

")" {
    right_par++;
    printf("(Token, Lexeme) = (RIGHTPAR, ')')\n");
}

"}" {
    right_par++;
    printf("(Token, Lexeme) = (RIGHTPAR, '}')\n");
}

"[" {
    left_par++;
    printf("(Token, Lexeme) = (LEFTPAR, '[')\n");
}

"]" {
    right_par++;
    printf("(Token, Lexeme) = (RIGHTPAR, ']')\n");
}

";"|"," {
    delimiters++;
    printf("(Token, Lexeme) = (DELIMITER, '%s')\n", yytext);
}

[ \t\r\n]+ {
}

. {
}

%%

int main()
{
    yylex();

    printf("\nDisplay Statistics of Tokens in Input\n\n");
    printf("Number of Keywords : %d\n", keywords);
    printf("Number of Identifiers : %d\n", identifiers);
    printf("Number of Integers : %d\n", integers);
    printf("Number of Assign Operators : %d\n", assign_ops);
    printf("Number of Arithmetic Operators : %d\n", arithmetic_ops);
    printf("Number of Relational Operators : %d\n", relational_ops);
    printf("Number of Left Parentheses : %d\n", left_par);
    printf("Number of Right Parentheses : %d\n", right_par);
    printf("Number of Delimiters : %d\n", delimiters);
    printf("Number of Single Line Comments : %d\n", comments);
    printf("Number of Character Literals: %d\n", char_literals);
    printf("Number of String Literals: %d\n", string_literals);

    return 0;
}
