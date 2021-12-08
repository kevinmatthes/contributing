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

### Default Build Instruction

```
make
```

This repository is intended to be bound as a submodule in projects.  It will
copy its `CONTRIBUTING.md` as well as the major content of the directories
`./.docs/` and `./lex/` to the binding project.

Please note that, for instance, the file `contributing.yaml` will not be copied
to the super project since this file contains the meta for this repository.  It
is intended to be created for the super project on demand, this is containing
the binding project's name and short description.  Users are encouraged to name
their project related meta data YAML file by their project.



### Copy License and / or Software Requirements

```
make license
make software
```

In order to copy either this repository's license or its list of required
software, just run the respective command.  Note that they will override
existing files automatically.



### Documentation

```
make pdf
```

This command will compile a printable version of this documentation using
`pandoc`.  It will be named `documentation.pdf`, by default.  Users are
encouraged to alter this default value of the variable `PDF` as desired.



### Lexers

```
make lexers
make install
make uninstall
```

These commands will compile the contained lexers which shall ensure the defined
conventions to be fulfilled.  In order to alter their default installation path,
just alter the according variable (`INSTALLDIR`) which is defined as
`~/.local/bin/`, by default.

<!----------------------------------------------------------------------------->
