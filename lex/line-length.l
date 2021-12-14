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
    #include "liblex.h"

    #define MAX_LENGTH      YYLAST == '\n' ? 0x51 : 0x50
    #define RESET           complained = false;

    #ifdef  NEWLINE
    #undef  NEWLINE
    #endif
    #define NEWLINE         if (complained) echo ("\n");

    void    complain_length (void);
    void    complain_line   (void);

    bool                    complained  = false;
    unsigned long long int  linecount   = 0x1;
%}

%% /***************************************************************************/

[^\n]*"\n"  complain_length(); linecount++; RESET;
[^\n]*      complain_length(); NEWLINE; complain_line (); RESET;

%% /***************************************************************************/

void complain_length (void)
{
    if (yyleng > (MAX_LENGTH))
    {
        fprintf ( yyout
                , "%lld (%d): %s"
                , linecount
                , yyleng - (MAX_LENGTH)
                , yytext
                );

        complained = true;
    };

    return;
}

inline void complain_line (void)
{
    fprintf (yyout, "%lld: No newline whitespace at the end!\n", linecount);
    return;
}

/******************************************************************************/
