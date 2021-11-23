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
    void    echo        (const char * const string);
    void    head_char   (void);
    void    subst_char  (const char old, const char new);
%}

punctation      ("."|"?"|"!"|":")
text            [^ \t\n]+
whitespace      [ \t\n]+

exception       ("prize"|"size")

center          "center"
color           "color"

punctation_rule {punctation}" "{text}
z_rule          "iza"|"ize"

%% /***************************************************************************/

{exception}         ECHO;

{center}            echo ("centre");
{color}             echo ("colour");

{punctation_rule}   head_char (); echo ("  "); echo (& yytext[0x2]);
{z_rule}            subst_char ('z', 's'); ECHO;

.                   ECHO;

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
