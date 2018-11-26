%{

	#include <stdio.h>
	#include "zjs.tab.h"
	int lines = 1;

%}
%option noyywrap
%%

end			return END;
";"			{ return END_STATEMENT;} 
point			return POINT; 
line			return LINE;
circle			return CIRCLE;
rectangle		return RECTANGLE;
set_color		return SET_COLOR;
[-+]?[0-9]+		return INT; 
[-+]?[0-9]*\.?[0-9]+	return FLOAT;
[\ \t]+ 		; /*do nothing, \s didn't work ?*/
[\n]			lines++;
.			printf(" %s found on line %d was not recognized!\n", yytext, lines);


%%

//int main(int argc, char** argv){
//	yylex();
//	return 0;
//}
