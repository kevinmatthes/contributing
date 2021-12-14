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
ARCHIVE	:= ar
CC		:= gcc
COPY	:= cp
DOXYGEN	:= doxygen
NEWDIR	:= mkdir
REMOVE	:= rm

# Software flags.
AFLAGS	:= rs
CFLAGS	:= -std=c99 -Wall -Werror -Wextra -Wpedantic -D__LIBLEX_INTERNAL__
LFLAGS	:= -lfl

# Make directories.
MDOX	:= -C ../.docs/latex/

# Directories.
LEXDIR		:= ../lex/
SUBMODDIR	:= ../../lib/
DIRS		:= $(LEXDIR) $(SUBMODDIR)

# Library compilation requirements.
DOXFILES	:= $(wildcard ./*.dox)
HEADERS		:= $(wildcard ./*.h)
LIBRARY		:= ./liblex.a
SOURCE		:= $(wildcard ./*.c)
OBJECTS		:= $(subst .c,.o, $(SOURCE))

# Concrete files.
DOXYFILE	:= ./doxygen.cfg
SELF		:= ./makefile



##
#
# Build instructions.
#
##

.PHONY: default doxygen lexmodule library submodule tidy

default: library

$(DIRS):
	$(NEWDIR) $@

doxygen: $(DOXFILES) $(HEADERS) $(SOURCE)
	$(DOXYGEN) $(DOXYFILE)
	make $(MDOX) all

library: $(LIBRARY)

$(LIBRARY): $(OBJECTS)
	$(ARCHIVE) $(AFLAGS) $@ $^

$(OBJECTS): $(SOURCE)
	$(CC) $(CFLAGS) -c $(LFLAGS) $^

lexmodule: $(HEADERS) $(LEXDIR) $(LIBRARY)
	$(COPY) $(HEADERS) $(LIBRARY) $(LEXDIR)
	make tidy

submodule: $(HEADERS) $(LIBRARY) $(SUBMODDIR)
	$(COPY) $(HEADERS) $(LIBRARY) $(SUBMODDIR)
	make tidy

tidy: $(LIBRARY) $(OBJECTS)
	$(REMOVE) $^

################################################################################
