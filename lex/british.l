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
    #include "liblex.h"
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

{ou}        {
                write_char (0x0);
                write_char (0x1);
                echo (yytext[0x1] == 'O' ? "U" : "u");
                echo (& YYLAST);
            };
{s}         {
                subst_char ('Z', 'S');
                subst_char ('z', 's');
                ECHO;
            };
{spacing}   {
                write_char (0x0);
                echo ("  ");
                echo (& yytext[0x2]);
            };

.   ECHO;

%% /***************************************************************************/

/******************************************************************************/
