%{

	#include <stdio.h>

%}

%%

end			{printf("END\n"); exit(0); /* quit the interpreter*/}
;			printf("END_STATEMENT\n"); //command to end a statement
point			printf("POINT\n"); //command for a point
line			printf("LINE\n"); //command for a line
circle			printf("CIRCLE\n"); //command for a circle
rect			printf("RECTANGLE\n"); //command for a rectangle
set_color		printf("SET_COLOR\n");  //match to set the  color
[-+]?[0-9]+		printf("INT\n"); //recognize an int
[-+]?[0-9]*\.?[0-9]+	printf("FLOAT\n"); //recognize a float
[\ \r\n\t]+ 		; //do nothing, \s didn't work ?
.			printf(" %s was not recognized!\n", yytext); //output everything else


%%

int main(int argc, char** argv){
	yylex();
	return 0;
}
