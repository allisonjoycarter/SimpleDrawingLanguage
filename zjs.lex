%{

	#include <stdio.h>
	int lines = 0;

%}
%option noyywrap
%%

end			{printf("END\n"); exit(0); }
;			printf("END_STATEMENT\n"); 
point			printf("POINT\n"); 
line			printf("LINE\n"); 
circle			printf("CIRCLE\n");
rect			printf("RECTANGLE\n");
set_color		printf("SET_COLOR\n");
[-+]?[0-9]+		printf("INT\n"); 
[-+]?[0-9]*\.?[0-9]+	printf("FLOAT\n");
[\ \t]+ 		; /*do nothing, \s didn't work ?*/
[\n]			lines++;
.			printf(" %s found on line %d was not recognized!\n", yytext, lines);


%%

int main(int argc, char** argv){
	yylex();
	return 0;
}
