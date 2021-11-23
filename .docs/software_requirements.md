<!--
    software_requirements.md : the dependencies of this project.

    See `LICENSE' for full license.
    See `README.md' for project details.
-->

<!--
    Copyright (C) 2021 Kevin Matthes

    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License along
    with this program; if not, write to the Free Software Foundation, Inc.,
    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-->

<!----------------------------------------------------------------------------->

# Software Requirements

This project requires several further applications and libraries in order to be
built and installed as intended.  These requirements will be listed and
explained in the following.

In case that there should be a variable of the build routine which requires the
concerning application, it will be named in parentheses behind the software's
name.  This enables users who would like to alter the application to easily
adjust the corresponding variable accordingly.



## `cat` (`LISTER`)

The default UNIX utility in order to write a file's content to `stdout` is used
in order to compose the contents of the `pandoc`-compiled documentation in the
intended order.

It can be altered as desired.



## `cp` (`COPY`)

The default UNIX utility for copying files around is required for copying the
project's main (utility) files into the super project when bound as a submodule.

It can be altered as desired.



## `gcc` (`CC`)

The C source code of this project needs to be compiled using an according
compiler which supports at least C99.

It can be altered as desired as long as the substitute supports the following
features:

* standard C99
* passing of symbolic constants (`#define`)
* linking with static C libraries



## `lex` (`LEX`)

The default UNIX utility for scanner creation is required in order to create the
sources files from the lex files of this repository.

It should not be altered.  `lex` is part of the `flex` package.



## `mkdir` (`NEWDIR`)

The default UNIX utility in order to create new directories ensures mandatory
directories of the super project to exist since they will be the default export
targets for some files.

It can be altered as desired.



## `pandoc` (`PANDOC`)

This GPL 2 library and application is used in order to create the printable
version of this project's documentation.

Altering this application could be difficult since the compilation routine of
the documentation is designed for `pandoc`.



## `rm` (`REMOVE`)

The default UNIX utility for deleting files is used in order to remove build
artifacts when they are not required any longer.

It can be altered as desired.



## `texlive-full`

`pandoc` requires a \LaTeX environment in order to compile the printable version
of this documentation.  The recommended \LaTeX environment is `texlive-full`
which can be installed by passing this as package name to the compiling system's
package manager.  Any other \LaTeX distribution is possible, as well, but not
tested.

It can be altered as desired.  Altering this software is not recommended,
anyway.

<!----------------------------------------------------------------------------->
