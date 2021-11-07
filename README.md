<!--
    README.md : important information regarding this project.

    See `LICENSE' for full license.
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

# contributing

## Summary

The central repository for the default `CONTRIBUTING.md`.

These are the guidelines I am using for all of my projects.  They will be bound
there as a submodule which references this repository.



## License

This project's license is **GPL 2** (as of June 1991).  The whole license text
can be found in `LICENSE` in the main directory of this repository.  The brief
version of the license is as follows:

> Copyright (C) 2021 Kevin Matthes
>
> This program is free software; you can redistribute it and/or modify
> it under the terms of the GNU General Public License as published by
> the Free Software Foundation; either version 2 of the License, or
> (at your option) any later version.
>
> This program is distributed in the hope that it will be useful,
> but WITHOUT ANY WARRANTY; without even the implied warranty of
> MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> GNU General Public License for more details.
>
> You should have received a copy of the GNU General Public License along
> with this program; if not, write to the Free Software Foundation, Inc.,
> 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.

When compiling a printable version of this documentation using `pandoc`, the
full license will be attached automatically to the resulting document.



## Build Instructions

This project offers the following build instructions in order create (parts) of
the provided utility:



### `default`

Process the default build instruction.  At the moment, this will copy the
contribution guidelines as well as some further utility files to the super
project which binds this one as a submodule.

This task is intended to be executed by calling:

```
make
```



### `$(DIRS)`

Create new directories in the super project in case they should not already
exist.  This rule ensures copy instructions to succeed.

This is just an internal build instruction.



### `license`

Copy this project's license to the super project in order to license it GPL 2
(as of June 1991), as well.

```
make license
```



### `contributing.pdf`

Create a printable version of this documentation.

```
make contributing.pdf
```



### `submodule`

Copy the contribution guidelines as well as some utility files from the
`./.docs/` directory to the super project.

```
make
# or
make submodule
```



### `../.docs/software_requirements.md`

Copy the basic software requirements of this project to the super project.  In
case the super project should have already defined own requirements, this
internal instruction ensures that those will not be overwritten.

This is just an internal build instruction.

<!----------------------------------------------------------------------------->
