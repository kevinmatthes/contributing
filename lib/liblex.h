/*
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

/**
 * \file    liblex.h
 * \brief   The main header of `liblex'.
 *
 * \author      Kevin Matthes
 * \copyright   (C) 2021 Kevin Matthes.
 *              This file is licensed GPL 2 as of June 1991.
 * \date        2021
 * \note        See `LICENSE' for full license.
 *              See `README.md' for project details.
 */

/******************************************************************************/

/*
 * Security settings.
 */

#pragma once
#ifndef __LIBLEX_H__
#define __LIBLEX_H__



/*
 * Includes.
 */

#include <stdbool.h>
#include <stdio.h>



/*
 * Macros.
 */

#define YYLAST  yytext[yyleng - 0x1]



/*
 * Function declarations.
 */

// Utility functions.
extern  void    echo    (const char * const string);
extern  int     main    (void);
extern  int     yylex   (void);



/*
 * Constants.
 */

extern  char *  yytext;
extern  FILE *  yyin;
extern  FILE *  yyout;
extern  int     yyleng;



/*
 * End of header.
 */

// Tidying up.
#ifndef __LIBLEX_INTERNAL__
#endif  // ! __LIBLEX_INTERNAL__

// Leaving the header.
#endif  // ! __LIBLEX_H__

/******************************************************************************/
