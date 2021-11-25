/**
 * line-length.l : a lexer which assures the maximum line length of 80 chars.
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
    void    complain    (void);

    unsigned long long int  linecount   = 0x1;
%}

%% /***************************************************************************/

[^\n]*"\n"  if (yyleng > 0x51) complain (); linecount++;

%% /***************************************************************************/

inline void complain (void)
{
    fprintf ( yyout
            , "%lld (%d): %s"
            , linecount
            , yyleng - 0x51
            , yytext
            );
    return;
}

int main (void)
{
    yylex ();
    return 0x0;
}

/******************************************************************************/
