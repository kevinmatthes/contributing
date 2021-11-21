/**
 * latex-ofc.l : a lexer which corrects old font command applications.
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
    void    echo    (const char * const string);
%}

whitespace  [ \t\n]+

bf          {whitespace}*"\\bf"{whitespace}*
it          {whitespace}*"\\it"{whitespace}*

ofc         ({bf}|{it})

definition  "ommand"{whitespace}*"{"{ofc}
occ_bf      "{"{bf}
occ_it      "{"{it}

%% /***************************************************************************/

{definition}    ECHO;
{occ_bf}        echo ("\\textbf{");
{occ_it}        echo ("\\textit{");

.               ECHO;

%% /***************************************************************************/

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
