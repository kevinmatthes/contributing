/**
 * whitespaces.l : a lexer which corrects whitespace issues.
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
    #define NEWLINE echo ("\n")
    #define YYLAST  yytext[yyleng - 0x1]

    void    crop_newline    (void);
    void    crop_space      (void);
    void    echo            (const char * const string);
%}

space   [ \t]+
token   [^ \t\n]+

content {token}?({space}{token})*
eol     {space}"\n"
line    {content}"\n"

case1   {content}{eol}
case2   {content}{space}

%% /***************************************************************************/

{line}      ECHO;
{eol}       NEWLINE;

{case1}     crop_newline (); crop_space (); ECHO; NEWLINE;
{case2}     crop_space (); ECHO; NEWLINE;

{content}   ECHO; NEWLINE;

%% /***************************************************************************/

inline void crop_newline (void)
{
    YYLAST = 0x0;
    yyleng--;
    return;
}

void crop_space (void)
{
    for (; YYLAST == ' ' || YYLAST == '\t'; yyleng--)
        YYLAST = 0x0;

    return;
}

inline void echo (const char * const string)
{
    fprintf (yyout, "%s", string);
    return;
}

int main (void)
{
    yylex ();
    return 0x0;
}
