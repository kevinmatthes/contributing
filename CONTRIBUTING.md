<!------------------------------------------------------------------------------
--
-- Copyright (C) 2021 Kevin Matthes
--
-- This program is free software; you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation; either version 2 of the License, or
-- (at your option) any later version.
--
-- This program is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License along
-- with this program; if not, write to the Free Software Foundation, Inc.,
-- 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
--
----
--
--  FILE
--      CONTRIBUTING.md
--
--  BRIEF
--      Important conventions regarding this project.
--
--  AUTHOR
--      Kevin Matthes
--
--  COPYRIGHT
--      (C) 2021─2022 Kevin Matthes
--      This file is licensed GPL 2 as of June 1991.
--
--  DATE
--      2021─2022
--
--  NOTE
--      See `LICENSE' for full license.
--      See `README.md' for project details.
--
------------------------------------------------------------------------------->

# Contributing to This Project

When contributing to this project, several conventions should be honoured in
order keep the overall appearance of this repository uniform.  These conventions
will be listed and explained in the following.

Please note that the conventions are sorted by the concerning coding languages
since they may differ between different languages.

For some conventions, lexers are provided by the `lex` directory of the
repository.  Running them over the source files ensures the described rules to
be fulfilled.  If there should be a lexer for a certain rule, its name will be
given in parenthesis after the name of the top-most rule.



## General Conventions

### Language (`british.l`)

All code and comments shall be written using **British English** with *-ise*
suffixes.

As in the terminology of \LaTeX, there will be *no* **French Spacing** such that
after finishing a phrase, two space characters or a line break must be placed.
This is only required if there will be another sentence following the previous
one.



### License

The license shall be attached at the document's beginning as a comment.  The
sole exception to this rule is the case that the actual file content is brief
enough, this is about one or two lines, such that the whole file can be shown on
a single display page.

Any file needs to contain the license information.

In order to determine the file's purpose easily, all files must contain a brief
line what this file will do.  This explanation shall also carry information
where to find the project details and the full license text and shall be
situated close to the license information.

After -- or, in case the exception of the license information placement rule can
be applied, before -- the license information, a separation of eighty characters
shall be placed in order to separate the information header of the file from its
effective content.  This separator must be a comment according to the language's
commenting conventions which does only contain the last character of the nested
comment's opening token.  In case a language should not have any nested comments
or the application of this rule would cause problems due to the repetition of
the last character of the opening token, the line comment shall be used instead.
In case a language should not have a convention for line comments and the
repetition of the last character of the opening token would cause problems,
neutral filling characters shall be used instead, such as `|`, `=`, `-`, for
instance.  In case that one of the comment types should be more common than the
other one, for instance the line comment in VHDL, the respective comment type
shall be used as in case the other one would cause problems.

```
/* C and related languages, such as C++, Java and even SQL (nested comment). */
/******************************************************************************/

{- Haskell. -}
{------------------------------------------------------------------------------}

# Julia.
#==============================================================================#

# Python.
################################################################################

<!-- Markdown and related languages. -->
<!----------------------------------------------------------------------------->

<!-- SVG. -->
<!--|||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||-->

-- VHDL.
--||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||--
```



### Line Length (`line-length.l`)

In general, if no exception is defined, lines shall contain at most eighty
characters plus a newline whitespace each.



### Trailing Newline (`line-length.l`, `whitespaces.l`)

Any file shall end with an empty line.



### Trailing Whitespaces (`whitespaces.l`)

Trailing whitespaces (spaces and tab characters) on any line shall be cropped.



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

In case that a block of code should contain only a single instruction, the
brackets of the concerning block  **must not** be set.  Instead, the concerning
instruction shall be placed **in the next line**, indented by a further level.



### Compiler and Options

The default C compiler for this project is **`gcc`**.  It has to be called with
*at least* the following flags and options:

* `-std=c99`
* `-Wall`
* `-Werror`
* `-Wextra`
* `-Wpedantic`



### Declaration Lists and `const`

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
should require real tab characters, this is `\t`, the tab character shall be
assumed to evaluate as a sequence of four spaces.

After type names, the next lexeme must start at the next tab stop.  Hence, after
entering a type name, the tabulator key needs to be pressed once.  An exception
to this rule are parameter lists.  For instance, this rule would be applied to
the signature of a function.

Functions **must not** be defined, but declared, applying this rule on their
signature.  This is, only when a function is *declared*, its return type,
identifier and parameter list need to be separated by pressing the tab key once.
If it is actually *defined*, return type, identifier and parameter list shall be
separated by a single space character only.  This exception shall ensure the
declaration lists of functions, especially in headers, to be intuitive readable.
On the other hand, it ensures definitions of functions being well recognisable,
as well.

After entering an identifier, such as a function's or variable's name, for
example, the next lexeme shall start at the next tab stop, too.  This, again,
needs to be applied to a function's declaration.

A `return` statement does not need to be followed by a tab stop but just one
space character, followed by the value to return in case there is one.  In case
that nothing is returned, `return` and `;` must not be separated by spaces.

Example:

```
void    foo     (void);
type_t  foo_    (type_t parameter);

void foo (void)
{
    return;
}

type_t foo_ (type_t parameter)
{
    type_t  ret_    = ONE;
    return ret_;
}
```



### Instructions

Although the language C allows it, instructions **must not** be united using the
comma operator (`,`) since this might cause confusion regarding the question
which block a certain instruction belongs to.  Instead, all instructions shall
only contain one statement.

This rule also holds for declaration lists.  Declarations **must not** be
summarised using commas.

The sole exception to this rule are `for` loops where the comma is allowed to be
used in order to increment multiple variables.



### Loop-breaking Commands and `goto` Statements

The design of a function shall exclude the necessity of any statements like

* `break` (except within `switch` statements)
* `continue`
* `goto`

Instead, Boolean values shall be used as flags in order to adjust the control
flow of a function.

In case this rule cannot be applied for some reasons, any of those tokens except
`goto` will be tolerated if there is a good reason for the application of these
key words.



### Name Mangling

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



### Numerals

C allows it to annotate numerals in order to clarify their intended range and
precision.  This shall be processed for this project, as well.

Any annotation, if possible, shall be made using *upper case* letters.  The same
holds for string formatting place holders.

Integers of type `int` oder `unsigned int` shall be annotated using their
hexadecimal notation.

```
int             i   = 0x0;
long long int   ll  = 0LL;
unsigned int    u   = 0U;
```



### Pointer Types

The pointer declaration requires at least one `*` to be noted in between the
type name and the identifier.  Thereby, the `*` **must not** be enclosing the
identifier or any other symbol but shall be separated by at least one space
character from them.

Multiple `*` shall be grouped without any spaces between them.

```
int *   foo = (void *) 0x0;
char ** bar = (void *) 0x0;
```

Pointers to structs enable the usage of the `->` operator.  When using it, it
shall be separated with **exactly** one space character from neighbouring
tokens.

```
void *  foo = bar -> foo_;
```



### Return Statements

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

In case that especially `for` loops, for example, do not contain any instruction
but are intructions themselves, they shall be treated like any other regular
instructions.

```
foo = 0x1;
bar = 0x2;

for (int i = 0x0; i < bar; i++)
    foo++;

foo = 0x0;
bar = 0x3;
for (int i = 0x0; i < 0x3; i++);
foo = 0x1;
bar = 0x2;
```

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
(for example `+=`), they are aligned such that the first column of the operator
with the most characters for representation which will be reached after a single
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

In case that a function should contain only few lines of code and all of them
are regular instructions, there **must not** be any blank lines in order to
separate the blocks from each other.  Furthermore, such functions should rather
be tagged `inline`.  The goal should be to make as much functions as possible
candidates for being tagged `inline`.

```
inline  int foo (void)
{
    int bar = 0x0;
    for (; bar < 0x2A; bar++);
    return bar;
}
```



### Standard

All C source code needs to apply **C99, ANSI C**.  The main aspect of this
standard is that function definitions *must not* be finished with a semicolon
character (`;`) as other standards allow it. The decision to use C99 as standard
shall ensure atmost portability of the project.

If the required standard is applied correctly can be tested by compiling with
the following options for the compiler `gcc`:

* `-std=c99`
* `-Wpedantic`



### Typedefs and Types

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

For some types, such as `unsigned` or `long` ones, it is not required to also
state the `int` type additionally.  Anyway, the `int` type declaration shall
**always** be stated if a number is an integer.

If available, `typedef` types shall be used instead of their definitions.



### `void` Parameter Lists

In case that functions do not need to receive any data as parameters, their
parameter list **must** be filled with `void` instead.



## \LaTeX

### Old Font Commands (`latex-ofc.l`)

Old font commands, such as `\bf` or `\it`, **must not** be used.  Instead, they
should be either replaced by their newer counterparts (`\textbf`, `\textit`) or
overwritten as an abbreviation of them.  Then, they should be adjusted regarding
their position within the curly brackets' range.



## Markdown

### Comments

Any Markdown file shall be finished with a comment of eighty characters which
only contains hyphens:

```
<!----------------------------------------------------------------------------->
```

This procedure shall ensure that contributed Markdown files can be compiled with
`pandoc` properly.

Since Markdown allows multiple styles of commenting, comments which do not
concern the file itself but the content (inactivating / activating certain
sections of the text) shall follow the compilation language's rules.  For
example, when compiled with `pandoc`, Markdown files will be converted into \TeX
files, at first.  Hence, comments which belong to the text are introduced using
`%` characters at the beginning of the comment.

If a comment belongs to the Markdown file, such as license information or the
file's purpose, they shall be marked as such using the Markdown syntax.

Comments for meta data blocks must always follow the conventions of the
according language.  This is, if YAML is used, comments need to be introduced
using `#` characters.



### Compilation

Any Markdown file needs to be formatted such that a compilation with `pandoc`
will result in the same layout.  Some Markdown interpreters allow, for example,
that itemisations do not need to be separated from the previous text.  `pandoc`,
instead, requires it in order to ensure the itemisation to be recognised as one.

Hence, a Markdown file can be considered well-formatted in case that `pandoc`
produces the intended result of the file.



### Indentation

Indentation has to be made using **four spaces** per level.  Tab characters
(`\t`) **must not** be used.

When using enumerations or itemisations, **at least two spaces** shall be used.
For each level of the itemisation, **two spaces** need to be set.  The number
of spaces for numeric enumerations depends on the count of digits $c$.  In
general, the count of spaces is $c + 1$ since not only the digits itself need to
be regarded but also the enumeration dot.

Enumeration numbers are aligned by their first digits **and not by their first
digits' meaning**.

```
<!-- Level 1. -->
    <!-- Level 2. -->

* Level 1.
  * Level 2.

1.  One.
    1. One: One.
    2. One: Two.
2.  Two.
3.  Three.
4.  Four.
5.  Five.
6.  Six.
7.  Seven.
8.  Eight.
9.  Nine.
10. Ten.
```

In short: when using enumerations or itemisations, the first column of the next
level of indentation is determined by the first column of the actual content of
the previous level of indentation.



### Meta Data

`pandoc` can be instructed how the result shall be produced by stating meta data
at the input file's beginning.  The language therefore is YAML.  YAML blocks
shall to be introduced and finished by `---` at the beginning of the document.
See `pandoc`'s documentation for possible values.

Since the Markdown documents are rendered by GitHub, as well, it is recommended
to separate the meta data from the actual content by saving it in a separate
file.  The file extension therefore shall be `*.yaml` although there are further
equivalent extensions for YAML.  Since most of the settings can be considered
constant for multiple files, constants should be outsourced into a further file
in order to avoid redundant data.

The recommended file extension for Markdown-related YAML is chosen in order to
distinct it from other YAML files.



### Sections

Sections shall be separated by three blank lines from neighbouring ones.  This
also concerns sections of different level but only in case that they actually
contain a line of text.

In case that a section does not contain any line of content but introduces a set
of subsections instead, one blank line for separation is sufficient.

```
# Section 1

## Subsection 1.1

Foo bar ...



### Subsubsection 1.1.1
```

Sections shall be introduced by `#` characters, one character per level.  Other
valid possibilities **must not** be used.

<!----------------------------------------------------------------------------->
