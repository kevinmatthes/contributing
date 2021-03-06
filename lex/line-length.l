/*
 * Copyright (C) 2021─2022 Kevin Matthes
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

/**
 * \file        line-length.l
 * \brief       A lexer which assures the maximum line length of 80 chars.
 * \author      Kevin Matthes
 * \copyright   (C) 2021─2022 Kevin Matthes.
 *              This file is licensed GPL 2 as of June 1991.
 * \date        2021─2022
 * \note        See `LICENSE' for full license.
 *              See `README.md' for project details.
 */

/******************************************************************************/

%{
    #include "liblex.h"

    #define MAX_LENGTH      YYLAST == '\n' ? 0x51 : 0x50
    #define NEWLINE         if (complained) newline ();
    #define RESET           complained = false;

    void    complain_length (void);
    void    complain_line   (void);

    bool                    complained  = false;
    unsigned long long int  linecount   = 0x1;
%}

%% /***************************************************************************/

[^\n]*"\n"  {
                complain_length ();
                linecount++;
                RESET;
            };
[^\n]*      {
                complain_length ();
                NEWLINE;
                complain_line ();
                RESET;
            };

%% /***************************************************************************/

inline void complain_length (void)
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
