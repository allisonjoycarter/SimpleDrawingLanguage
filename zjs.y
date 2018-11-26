%{
	#include <stdio.h>
	#include "zoomjoystrong.h"
	int yyerror(const char* err);

%}

%token END
%token END_STATEMENT
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token INT
%token FLOAT

%union {
	int ival;
	float fval;
}

%type <ival> INT
%%

program: 	list_of_commands END END_STATEMENT
       ;

list_of_commands:	command END_STATEMENT
		|	list_of_commands command END_STATEMENT 
		;
command:		LINE INT INT INT INT 
       			{ line((int) $2, (int) $3, (int) $4, (int) $5); }
       |		POINT INT INT 
			{ point((int)$2,(int)$3);}
	|		CIRCLE INT INT INT 
			{ circle((int)$2,(int)$3,(int)$4);}
	|		RECTANGLE INT INT INT INT 
			{ rectangle((int) $2,(int) $3,(int) $4,(int) $5);}
	|		SET_COLOR INT INT INT 
			{set_color((int) $2,(int) $3,(int) $4);}
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
