/*
  Created by: Matt Breckon and Dean Way
  File name: c-.flex
  To build: 
    $ jflex c-.flex
    $ javac Lexer.java
*/
   
/* --------------------------Usercode Section------------------------ */
   
import java_cup.runtime.*;
      
%%
   
/* -----------------Options and Declarations Section----------------- */
   
/* 
   The name of the class JFlex will create will be Lexer.
   Will write the code to the file Lexer.java. 
*/
%class Lexer

/*
  The current line number can be accessed with the variable yyline
  and the current column number with the variable yycolumn.
*/
%line
%column
    
/* 
   Will switch to a CUP compatibility mode to interface with a CUP
   generated parser.
*/
%cup
   
/*
  Declarations
   
  Code between %{ and %}, both of which must be at the beginning of a
  line, will be copied letter to letter into the lexer class source.
  Here you declare member variables and functions that are used inside
  scanner actions.  
*/
%{   
    /* To create a new java_cup.runtime.Symbol with information about
       the current token, the token will have no value in this
       case. */
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    
    /* Also creates a new java_cup.runtime.Symbol with information
       about the current token, but this object has a value. */
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
%}

/*
  Macro Declarations
  
  These declarations are regular expressions that will be used later
  in the Lexical Rules Section.  
*/
LineTerminator = \r|\n|\r\n
WhiteSpace     = {LineTerminator} | [ \t\f]
digit = [0-9]
number = {digit}+
letter = [a-zA-Z]
identifier = {letter}+
   
%%
/* ------------------------Lexical Rules Section---------------------- */
/* Keywords */
"else"             { return symbol(sym.ELSE); }
"if"               { return symbol(sym.IF); }
"int"              { return symbol(sym.INT); }
"return"           { return symbol(sym.RETURN); }
"void"             { return symbol(sym.VOID); }
"while"            { return symbol(sym.WHILE); }
/* Special symbols */
"+"                { return symbol(sym.PLUS); }
"-"                { return symbol(sym.MINUS); }
"*"                { return symbol(sym.TIMES); }
"/"                { return symbol(sym.OVER); }
"<"                { return symbol(sym.LT); }
"<="               { return symbol(sym.LTEQ); }
">"                { return symbol(sym.GT); }
">="               { return symbol(sym.GTEQ); }
"=="               { return symbol(sym.EQ); }
"!="               { return symbol(sym.NOTEQ); }
"="                { return symbol(sym.ASSIGN); }
";"                { return symbol(sym.SEMI); }
","                { return symbol(sym.COMMA); }
"("                { return symbol(sym.LPAREN); }
")"                { return symbol(sym.RPAREN); }
"["                { return symbol(sym.LBRACKET); }
"]"                { return symbol(sym.RBRACKET); }
"{"                { return symbol(sym.LBRACE); }
"}"                { return symbol(sym.RBRACE); }
/* Other tokens */
{identifier}       { return symbol(sym.ID, yytext()); }
{number}           { return symbol(sym.NUM, yytext()); }
{WhiteSpace}*      { /* skip whitespace */ }   
"/*".*"*/"         { /* skip comments */ }
.                  { return symbol(sym.ERROR); }