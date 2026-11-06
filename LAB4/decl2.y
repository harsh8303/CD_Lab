/* C declarations */
%{
#include <stdio.h>

int yylex(void);
void yyerror(char *);

extern int yychar, yylineno;
extern char *yytext;

int count = 0;
%}

/* YACC Declarations */

%token INT FLOAT CHAR ID

/* Grammar follows */
%%

decls
    : decls decl
    | decl
    ;

decl
    : type list ';'
      {
          count++;
          printf("%d Declaration statements parsed successfully\n", count);
      }
    ;

type
    : INT
      {
          printf("Data type is int\n");
      }
    | FLOAT
      {
          printf("Data type is float\n");
      }
    | CHAR
      {
          printf("Data type is char\n");
      }
    ;

list
    : list ',' ID
      {
          printf("Next Identifier is %s\n", yytext);
      }
    | ID
      {
          printf("First Identifier is %s\n", yytext);
      }
    ;

%%

void yyerror(char *s)
{
    printf("%s Line number %d near symbol %c\n",
           s, yylineno, (char)yychar);
}

int main()
{
    yyparse();
    return 0;
}
