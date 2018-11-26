%{
	#include <stdio.h>
	#include "zoomjoystrong.h"
	int yyerror(const char* err);

%}

%union {
	int ival;
	float fval;
}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token <ival> INT
%token <fval> FLOAT

%%

program: 	list_of_commands END END_STATEMENT
       ;

list_of_commands:	command END_STATEMENT
		|	list_of_commands command END_STATEMENT 
		;
command:		LINE INT INT INT INT 
       			{ line( $2, $3,  $4,  $5); }
       |		POINT INT INT 
			{ point($2,$3);}
	|		CIRCLE INT INT INT 
			{ circle($2,$3,$4);}
	|		RECTANGLE INT INT INT INT 
			{ rectangle( $2, $3, $4, $5);}
	|		SET_COLOR INT INT INT 
			{set_color( $2, $3, $4);}
	;


%%

int main(int argc, char** argv) {
	setup();
	yyparse();
	finish();

}

int yyerror(const char* err) {
	printf("%s\n", err);
}
