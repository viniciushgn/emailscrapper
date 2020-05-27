
%{
#include <stdio.h>
%}

PALAVRA [a-zA-Z]+
PALAVRAE [a-zA-z0-9_.-]+
PALAVRAI [a-zA-z0-9]+
INTEIRO [0-9]+
ESPECIAL [-_.]+


%%


{ESPECIAL}{PALAVRAE}@{PALAVRAE} {
//  printf("%s\n", yytext);
}
{PALAVRAE}{ESPECIAL}@{PALAVRAE} {
//  printf("%s\n", yytext);
}

{PALAVRAE}@{ESPECIAL}{PALAVRAE} {
//  printf("%s\n", yytext);
}

{PALAVRAE}@{PALAVRAE}{PALAVRAI}[.] {
  //---------------------
  int n;
  n = strlen(yytext);
     yytext[n - 1] = '\0';
//-----------------------
  printf("%s\n", yytext);
}


{PALAVRAE}@{PALAVRAE}{ESPECIAL} {
//  printf("%s\n", yytext);

}




{PALAVRAE}@{PALAVRAE} {
  printf("%s\n", yytext);
}









[[:space:]]+ ;
[[:^space:]]+ ;

[.\n]* ;


%%

int main() {
  yylex();
  return 0;
}
