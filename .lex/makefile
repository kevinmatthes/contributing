##
#
# makefile : build instructions for the project.
#
# See `LICENSE' for full license.
# See `README.md' for project details.
#
##

##
#
# Copyright (C) 2021 Kevin Matthes
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#
##

################################################################################

##
#
# Variables.
#
##

# Software.
CC		:= gcc
COPY	:= cp
LEX		:= lex
NEWDIR	:= mkdir
REMOVE	:= rm

# Directories.
INSTALLDIR	:= ~/.local/bin/
SUBMODDIR	:= ../../.lex/
DIRS		:= $(INSTALLDIR) $(SUBMODDIR)

# Lexer compilation requirements.
LEXAUX		:= ./lex.yy.c
LEXFILES	:= $(wildcard ./*.l)
LEXERS		:= $(subst .l,, $(LEXFILES))

# Concrete files.
SELF	:= ./makefile



##
#
# Build instructions.
#
##

.PHONY: default install lexers submodule tidy uninstall

default: lexers

$(DIRS):
	$(NEWDIR) $@

install: $(INSTALLDIR) $(LEXERS)
	$(COPY) $(LEXERS) $(INSTALLDIR)
	make tidy

lexers: $(LEXERS)

$(LEXERS): $(LEXFILES)
	$(foreach lexfile, $^, $(shell $(LEX) $(lexfile) ; $(CC) -lfl $(LEXAUX) -o \
	$(subst .l,, $(lexfile))))

submodule: $(LEXFILES) $(SELF) $(SUBMODDIR)
	$(COPY) $(LEXFILES) $(SELF) $(SUBMODDIR)

tidy: lexers
	$(REMOVE) $(LEXAUX) $(LEXERS)

uninstall: install
	$(foreach lexer, $(LEXERS), $(REMOVE) -f $(INSTALLDIR)$(lexer))

################################################################################
