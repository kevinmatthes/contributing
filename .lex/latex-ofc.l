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
    bool    em_override = false;
    bool    it_override = false;
    bool    rm_override = false;
    bool    sf_override = false;
    bool    sl_override = false;
    bool    tt_override = false;
%}

command     "\\"(("re"?"new"|"provide")"c"|"DeclareRobustC")"ommand"
whitespace  [ \t\n]+

definition      {command}{whitespace}?"{"
override_on     "%"[  \t]*"#define"[ \t]+"__LATEX_COMMAND__"
override_off    "__"[ \t]*"\n"

bf  {whitespace}?"\\bf"{whitespace}?
em  {whitespace}?"\\em"{whitespace}?
it  {whitespace}?"\\it"{whitespace}?
rm  {whitespace}?"\\rm"{whitespace}?
sf  {whitespace}?"\\sf"{whitespace}?
sl  {whitespace}?"\\sl"{whitespace}?
tt  {whitespace}?"\\tt"{whitespace}?

ofc {bf}|{em}|{rm}|{sf}|{sl}|{tt}

def_bf  {definition}{bf}
def_em  {definition}{em}
def_it  {definition}{it}
def_rm  {definition}{rm}
def_sf  {definition}{sf}
def_sl  {definition}{sl}
def_tt  {definition}{tt}

occ_bf  "{"{bf}
occ_em  "{"{em}
occ_it  "{"{it}
occ_rm  "{"{rm}
occ_sf  "{"{sf}
occ_sl  "{"{sl}
occ_tt  "{"{tt}

ovr_bf  {override_on}"BF"{override_off}
ovr_em  {override_on}"EM"{override_off}
ovr_it  {override_on}"IT"{override_off}
ovr_rm  {override_on}"RM"{override_off}
ovr_sf  {override_on}"SF"{override_off}
ovr_sl  {override_on}"SL"{override_off}
ovr_tt  {override_on}"TT"{override_off}

%% /***************************************************************************/

"%"[^\n]*{definition}{ofc}[^\n]*"\n"    ECHO;

{def_bf}|{ovr_bf}   bf_override = true; ECHO;
{def_em}|{ovr_em}   em_override = true; ECHO;
{def_it}|{ovr_it}   it_override = true; ECHO;
{def_rm}|{ovr_rm}   rm_override = true; ECHO;
{def_sf}|{ovr_sf}   sf_override = true; ECHO;
{def_sl}|{ovr_sl}   sl_override = true; ECHO;
{def_tt}|{ovr_tt}   tt_override = true; ECHO;

{occ_bf}    echo (bf_override ? "\\bf{" : "\\textbf{");
{occ_em}    echo (em_override ? "\\em{" : "\\emph{");
{occ_it}    echo (it_override ? "\\it{" : "\\textit{");
{occ_rm}    echo (rm_override ? "\\rm{" : "\\textrm{");
{occ_sf}    echo (sf_override ? "\\sf{" : "\\textsf{");
{occ_sl}    echo (sl_override ? "\\sl{" : "\\textsl{");
{occ_tt}    echo (tt_override ? "\\tt{" : "\\texttt{");

.   ECHO;

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
