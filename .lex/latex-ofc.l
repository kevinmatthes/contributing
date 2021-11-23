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
    #include <stdbool.h>

    void    echo    (const char * const string);

    bool    bf_override = false;
    bool    it_override = false;
%}

whitespace  [ \t\n]+

bf          {whitespace}?"\\bf"{whitespace}?
definition  "ommand"{whitespace}?"{"
it          {whitespace}?"\\it"{whitespace}?

def_bf      {definition}{bf}
def_it      {definition}{it}
occ_bf      "{"{bf}
occ_it      "{"{it}

%% /***************************************************************************/

{def_bf}    bf_override = true; ECHO;
{def_it}    it_override = true; ECHO;
{occ_bf}    echo (bf_override ? "\\bf{" : "\\textbf{");
{occ_it}    echo (it_override ? "\\it{" : "\\textit{");

.           ECHO;

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

/******************************************************************************/
