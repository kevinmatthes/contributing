<!--
    CONTRIBUTING.md : important conventions regarding this project.

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

# Contributing to this project

When contributing to this project, several conventions should be honoured in
order keep the overall appearance of this repository uniform.  These conventions
will be listed and explained in the following.

Please note that the conventions are sorted by the concerning coding languages
since they may differ between different languages.



## C

### Brackets

Opening brackets of blocks (`{`) require their own line each.  The indentation
has to be the same like the one of the expression opening it.  For instance:

```
int foo (void)
{
    return 0x0;
}
```

An exception to this rule are `enum`s and array initialisations which are
counted to the category of further lists.

Any other lists shall be handled according to the *Haskell* conventions, such as
parameter lists, `enum` definitions and array initialisations, for instance.  An
example is as follows:

```
typedef enum    { ONE
                , TWO
                , THREE
                } type_t;

int foo ( type_t one
        , type_t two
        , type_t three
        )
{
    return 0x0;
}
```

Closing curly brackets (`}`) are always followed by a semicolon (`;`) except
where the used standard and, hence, the compiler denies it.  This ensures that
after a `typedef` of structs, for example, the mandatory semicolon will never be
forgotten.



### Compiler and options

The default C compiler for this project is **`gcc`**.  It has to be called with
*at least* the following flags and options:

* `-std=c99`
* `-Wall`
* `-Werror`
* `-Wextra`
* `-Wpedantic`



### Declaration lists and `const`

In some situations, multiple symbols need to be declared.  For instance, at the
beginning of a function where auxillary variables for the calculation are
introduced.

There, all types, identifiers and values need to be aligned by tab stops in
order to achieve a table-like structure for the whole declaration list:

```
bool        ret     = false;
const int   answer  = 0x2A;
const int   number  = 0x17;
const int   value   = 0x0;
string_t    text    = "foo";
```

If possible, symbols shall be grouped alphabetically by first their types and
then their identifiers.  Thereby, the qualifier `const` is considered part of
the type name and, hence, to be shelved in within the "c" section.

In case the grouping by types should fail due to dependencies of the variables'
values, the concerning declaration shall be made in another declaration list /
declaration block underneath the first one.  The second block shall be separated
by exactly one blank line from the first one and can be considered the "Block of
Declarations of Second Degree" since the first block is required in order to
introduce the second one.  The same holds for third degree and so on.  If
possible, the identifiers should be adjusted rather than opening a new block of
declarations, especially if it would only contain a single declaration.

The qualifier `const` is to use whenever possible and to annotate on the
left-hand side of a type name, like `const int`.

Per line, only **one** declaration is possible.  This benefits the editing in
case that a certain variable proves obsolete.

Within a declaration list, all tokens need be aligned as stated except that the
current block does not need to fit the alignment of a neighbouring one.

These rules also hold for the declaration of functions in a header.



### Identifiers

Identifiers shall be chosen such that people who are not involved regarding the
source code design might also understand the meaning and content of the symbols
intuitively.

Hungarian Notation and its variations **must not** be used.  Instead, users are
encouraged to give identifiers like `maximum` to a variable which holds the
greatest value of an integer array, for instance.

In case that symbols are exported, such as functions or constants, they all must
carry the project's common prefix, specified by the `NAME` macro.  Even internal
functions shall be mangled by `NAME` since this benefits not only the continuity
during the process of coding but also assures the case that this function might
be exported, as well, in a future version of the project.



### Indentation

Indentation is processed by **four spaces** per level.  In case some situations
should require real tab characters, i. e. `\t`, the tab character shall be
assumed to evaluate as a sequence of four spaces.

After type names, the next lexeme must start at the next tab stop.  Hence, after
entering a type name, the tabulator key needs to be pressed once.  An exception
to this rule are parameter lists.  For instance, this rule would be applied to
the signature of a function.

After entering an identifier, such as a function's or variable's name, for
example, the next lexeme shall start at the next tab stop, too.  This, again,
needs to be applied to a function's declaration.

A `return` statement does not need to be followed by a tab stop but just one
space character, followed by the value to return in case there is one.  In case
that nothing is returned, `return` and `;` must not be separated by spaces.

Example:

```
void    foo (void)
{
    return;
}

type_t  foo_    (type_t parameter)
{
    type_t  ret_    = ONE;
    return ret_;
}
```



### Language

All code and comments shall be written using **British English** with *-ise*
suffixes.

As in the terminology of LaTeX, there will be *no* **French Spacing** such that
after finishing a phrase, two space characters or a line break must be placed.
This is only required if there will be another sentence following the previous
one.



### Loop-breaking commands and `goto` statements

The design of a function shall exclude the necessity of any statements like

* `break` (except within `switch` statements)
* `continue`
* `goto`

Instead, Boolean values shall be used as flags in order to adjust the control
flow of a function.

In case this rule cannot be applied for some reasons, any of those tokens except
`goto` will be tolerated if there is a good reason for the application of these
key words.



### Name mangling

If the exported symbols share common prefixes, they must be mangled using the
preprocessor macro `NAME(identifier)`.  This macro has to be removed at the end
of the header unless an according symbolic constant is defined.  This constant
should be passed to the compiler during the build process.  The macro is
mandatory to use in all source files when a symbol requires the prefix.
Internal symbols do not need to be mangled.  Anyway, a mangling is recommended,
as well, since they may be exported in a future version.

Common parameter declarations for exported functions can be abbreviated, as
well, for instance identifiers like `self` and `other`.  Once defined, they
should be used just like the name mangling macro, including the automatic
cleaning once the header is left.



### Return statements

Any function must contain exactly **one** `return` statement.  This also
includes `void` functions.

In case that functions may be quit at different positions, the general design of
the function has to be adjusted such that only return statement is left.  This
may be done, for instance, by using Boolean values as flags for refactoring the
control flow of the function.

The only reasonable exception to this convention is the argument of performance.
If the performance of a function is critical for the success of the project,
this convention does not need to be applied.  Such functions have to be marked
`inline`.  Hence, `inline` functions are the only ones which are allowed to
contain more than one return statement, **if and only if** their performance is
optimised due to multiple statements.  They need to contain at least one, even
if they are `void`.



### Spacing

When ending a block, **no** blank lines must be noted at the end of it.

Control flow elements, such as `if`, `for`, `switch` and so on shall be
separated a single blank line from the previous sequence of code.  This holds
especially for the cases that they not only contain a single line of code each.

Except those rules where according exceptions are defined, symbols should be
aligned using tab stops as defined above in order to achieve a table-like
structure of the code.  This is only relevant if a sequence of code contains
subsequent assignments, for instance.

```
ret         = true;
variable    = 0x2A;
```

Again, as for the declaration blocks / declaration lists, sequences which are
separated by a single blank line from each other do not need to fit the
alignment of their neighbouring blocks / sequences.

Operators have to be separated by at least one space character from their
operands.  This also holds for negation (`!`).  In case that sequences of code
should include not only ordinary assignments (`=`) but also shortcut assignments
(e. g. `+=`), they are aligned such that the first column of the operator with
the most characters for representation which will be reached after a single
space character is considered the reference for the whole block / sequence:

```
i   += 0x2;
j   =  0x0;
```

Like the GNU coding style states, functions as well as function-like operators,
such as `sizeof`, shall be separated by a single space character from the
following parenthesis except in case that

* the parenthesis will introduce a parameter list
* the parenthesis is used to define a preprocessor macro

In these cases, the according rules will be applied.  For the case of the macro
definition, the usage of a single space character is obviously causing
unintended side effects.

```
#define MACRO(arg)  prefix_ ## arg

void    foo_    (void)
{
    return;
}
```

The rule for function declaration does also hold for preprocessor macro
definition except the spacing between indentifier and parenthesis.



### Standard

All C source code needs to apply **C99, ANSI C**.  The main aspect of this
standard is that function definitions *must not* be finished with a semicolon
character (`;`) as other standards allow it. The decision to use C99 as standard
shall ensure atmost portability of the project.

If the required standard is applied correctly can be tested by compiling with
the following options for the compiler `gcc`:

* `-std=c99`
* `-Wpedantic`



### Typedefs and types

`typedef` statements have to be made in header files only.  Furthermore, they
need to bring a security feature with them such that, in case the type was
already defined, no name clashes will occur.

The security feature shall be implemented as `#define` check as follows:

```
#ifndef __TYPEDEF__TYPE_T__
#define __TYPEDEF__TYPE_T__
typedef int type_t;
#endif  // ! __TYPEDEF__TYPE_T__
```

After the `typedef` token, the next tab stop needs to be reached.  The same
holds for types in general, except in cases where exceptions of the tab stop
rule allow to use a single space character, such as in parameter lists, for
instance.



### `void` parameter lists

In case that functions do not need to receive any data as parameters, their
parameter list **must** be filled with `void` instead.
