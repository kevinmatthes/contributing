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
COPY	:= cp
REMOVE	:= rm

# Make directories.
MDOCS	:= -C ./.docs/
MLIB	:= -C ./lib/
MLEX	:= -C ./lex/

# Directories.
DOXDIR	:= ./.docs/html/ ./.docs/latex/

# Concrete files.
CONTRIBUTING	:= ./CONTRIBUTING.md
LICENSE			:= ./LICENSE
PDF				:= ./.docs/documentation.pdf
REFMAN			:= ./.docs/latex/refman.pdf



##
#
# Build instructions.
#
##

.PHONY:	default \
		doxygen \
		install \
		lexers \
		library \
		license \
		manual \
		pdf \
		software \
		submodule \
		tidy \
		uninstall

default: submodule

doxygen: $(REFMAN)

install:
	make $(MLEX) install

lexers:
	make $(MLEX) lexers

library:
	make $(MLIB) library

license: $(LICENSE)
	$(COPY) $^ ../

manual: $(PDF) $(REFMAN)
	$(COPY) $(PDF) ./contributing.pdf
	$(COPY) $(REFMAN) ./liblex.pdf

pdf: $(PDF)

$(PDF):
	make $(MDOCS) pdf

$(REFMAN):
	make $(MLIB) doxygen

software:
	make $(MDOCS) software

submodule: $(CONTRIBUTING)
	$(COPY) $(CONTRIBUTING) ../
	make $(MDOCS) submodule

tidy: $(REMFAN)
	$(REMOVE) $(DOXDIR) $(wildcard ./*.pdf) -rf
	make $(MDOCS) tidy
	make $(MLIB) tidy
	make $(MLEX) tidy

uninstall:
	make $(MLEX) uninstall

################################################################################
