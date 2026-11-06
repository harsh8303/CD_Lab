%option noyywrap
%%
a*c*  {printf("Token 2 found \n");}
a+b*  {printf("Token 1 found \n");}
%%
int main() { yylex();}
