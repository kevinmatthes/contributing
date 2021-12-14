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
 * \file    crop_newline.c
 * \brief   Remove one trailing newline whitespace from the current lexeme.
 *
 *
 *
 * This inline function will remove the last character from `yytext` in case
 * that it is a newline whitespace.  This task is frequently demanded by some
 * lexfiles.  Thereby, `yyleng` will be adjusted automatically.
 *
 *
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
 * Includes.
 */

#include "liblex.h"



/*
 * Functions.
 */

inline void crop_newline (void)
{
    if (YYLAST == '\n')
    {
        YYLAST = 0x0;
        yyleng--;
    };

    return;
}

/******************************************************************************/
