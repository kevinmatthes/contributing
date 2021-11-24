/**
 * british.l : a lexer which converts input files to British English.
 *
 * See `LICENSE' for full license.
 * See `README.md' for project details.
 */

/**
 * Copyright (C) 2021 Kevin Matthes
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

/******************************************************************************/

%{
    #define YYLAST  yytext[yyleng - 0x1]

    void    echo        (const char * const string);
    void    head_char   (void);
    void    subst_char  (const char old, const char new);
%}

punctuation "."|"?"|"!"|":"
text        [^ \t\n]+
whitespace  [ \t\n]+

ou          [BbLlVv][Oo][Rr]|[Mm][Oo][Ss]
s           [Ii][Zz][AaEe]
spacing     {punctuation}" "{text}

%% /***************************************************************************/

[Bb][Oo][Rr][EeIi]      ECHO;
[IiYy][Ll][Oo][Rr]      ECHO;
[Mm][Oo][Ss]{text}      ECHO;
Mr?[rs]". "{text}       ECHO;
[PpSs][Rr]?[Ii][Zz][Ee] ECHO;

"center"    echo ("centre");
"theater"   echo ("theatre");

{ou}        head_char (); echo ("ou"); echo (& YYLAST);
{s}         subst_char ('Z', 'S'); subst_char ('z', 's'); ECHO;
{spacing}   head_char (); echo ("  "); echo (& yytext[0x2]);

.           ECHO;

%% /***************************************************************************/

inline void echo (const char * const string)
{
    fprintf (yyout, "%s", string);
    return;
}

inline void head_char (void)
{
    fprintf (yyout, "%c", yytext[0x0]);
    return;
}

int main (void)
{
    yylex ();
    return 0x0;
}

void subst_char (const char old, const char new)
{
    for (unsigned long long int i = 0x0; yytext[i]; i++)
        if (yytext[i] == old)
            yytext[i] = new;

    return;
}

/******************************************************************************/
