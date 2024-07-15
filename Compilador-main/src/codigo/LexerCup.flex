package codigo;
import java_cup.runtime.Symbol;
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%


{espacio} {/*Ignore*/}


( "//"(.)* ) {/*Ignore*/}


( "\"" ) {return new Symbol(sym.Comillas, yychar, yyline, yytext());}


( byte | char | long | flotante | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}


( "entero" ) {return new Symbol(sym.Entero, yychar, yyline, yytext());}


( cadena ) {return new Symbol(sym.Cadena, yychar, yyline, yytext());}


( si ) {return new Symbol(sym.Si, yychar, yyline, yytext());}


( sino ) {return new Symbol(sym.Sino, yychar, yyline, yytext());}


( hacer ) {return new Symbol(sym.Hacer , yychar, yyline, yytext());}


( mientras ) {return new Symbol(sym.Mientras, yychar, yyline, yytext());}


( ciclo ) {return new Symbol(sym.For, yychar, yyline, yytext());}


( "=" ) {return new Symbol(sym.Igual, yychar, yyline, yytext());}


( "+" ) {return new Symbol(sym.Suma, yychar, yyline, yytext());}


( "-" ) {return new Symbol(sym.Resta, yychar, yyline, yytext());}


( "*" ) {return new Symbol(sym.Multiplicacion, yychar, yyline, yytext());}


( "/" ) {return new Symbol(sym.Division, yychar, yyline, yytext());}


( "&&" | "||" | "!" | "&" | "|" ) {return new Symbol(sym.Op_logico, yychar, yyline, yytext());}


( ">" | "<" | "==" | "!=" | ">=" | "<=" | "<<" | ">>" ) {return new Symbol(sym.Op_relacional, yychar, yyline, yytext());}


( "+=" | "-="  | "*=" | "/=" | "%=" | "=" ) {return new Symbol(sym.Op_atribucion, yychar, yyline, yytext());}


( "++" | "--" ) {return new Symbol(sym.Op_incremento, yychar, yyline, yytext());}


( true | false ) {return new Symbol(sym.Op_booleano, yychar, yyline, yytext());}


( "(" ) {return new Symbol(sym.Parentesis_a, yychar, yyline, yytext());}


( ")" ) {return new Symbol(sym.Parentesis_c, yychar, yyline, yytext());}


( "{" ) {return new Symbol(sym.Llave_a, yychar, yyline, yytext());}


( "}" ) {return new Symbol(sym.Llave_c, yychar, yyline, yytext());}


( "[" ) {return new Symbol(sym.Corchete_a, yychar, yyline, yytext());}


( "]" ) {return new Symbol(sym.Corchete_c, yychar, yyline, yytext());}

/* Marcador de inicio de algoritmo */
( "principal" ) {return new Symbol(sym.Main, yychar, yyline, yytext());}

/* Imprimir */
( "presentar" ) {return new Symbol(sym.Presentar, yychar, yyline, yytext());}

/* Punto Flotante */
( "." ) {return new Symbol(sym.P_Flotante, yychar, yyline, yytext());}

/* Punto y coma */
( ";" ) {return new Symbol(sym.P_coma, yychar, yyline, yytext());}

/* Identificador */
{L}({L}|{D})* {return new Symbol(sym.Identificador, yychar, yyline, yytext());}

/* Numero */
("(-"{D}+")")|{D}+ {return new Symbol(sym.Numero, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.ERROR, yychar, yyline, yytext());}
