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
    bool    rm_override = false;
    bool    sf_override = false;
    bool    sl_override = false;
    bool    tt_override = false;
%}

whitespace  [ \t\n]+

definition  [Cc]"ommand"{whitespace}?"{"

bf  {whitespace}?"\\bf"{whitespace}?
it  {whitespace}?"\\it"{whitespace}?
rm  {whitespace}?"\\rm"{whitespace}?
sf  {whitespace}?"\\sf"{whitespace}?
sl  {whitespace}?"\\sl"{whitespace}?
tt  {whitespace}?"\\tt"{whitespace}?

def_bf  {definition}{bf}
def_it  {definition}{it}
def_rm  {definition}{rm}
def_sf  {definition}{sf}
def_sl  {definition}{sl}
def_tt  {definition}{tt}

occ_bf  "{"{bf}
occ_it  "{"{it}
occ_rm  "{"{rm}
occ_sf  "{"{sf}
occ_sl  "{"{sl}
occ_tt  "{"{tt}

%% /***************************************************************************/

{def_bf}    bf_override = true; ECHO;
{def_it}    it_override = true; ECHO;
{def_rm}    rm_override = true; ECHO;
{def_sf}    sf_override = true; ECHO;
{def_sl}    sl_override = true; ECHO;
{def_tt}    tt_override = true; ECHO;

{occ_bf}    echo (bf_override ? "\\bf{" : "\\textbf{");
{occ_it}    echo (it_override ? "\\it{" : "\\textit{");
{occ_rm}    echo (rm_override ? "\\rm{" : "\\textrm{");
{occ_sf}    echo (sf_override ? "\\sf{" : "\\textsf{");
{occ_sl}    echo (sl_override ? "\\sl{" : "\\textsl{");
{occ_tt}    echo (tt_override ? "\\tt{" : "\\texttt{");

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
