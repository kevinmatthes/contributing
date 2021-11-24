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
LISTER	:= cat
NEWDIR	:= mkdir
PANDOC	:= pandoc
REMOVE	:= rm

# Software flags.
PFLAGS	:= -N

# Make directories.
MDOCS	:= -C ./.docs/
MLEX	:= -C ./.lex/

# Directories.
DOCSDIR	:= ../.docs/
DIRS	:= $(DOCSDIR)

# Concrete files.
CONTRIBUTING	:= ./CONTRIBUTING.md
LICENSE			:= ./LICENSE



##
#
# Build instructions.
#
##

.PHONY: default
default: submodule

$(DIRS):
	$(NEWDIR) $@

.PHONY: install
install:
	make $(MLEX) install

.PHONY: lexers
lexers:
	make $(MLEX) lexers

.PHONY: license
license: $(LICENSE)
	$(COPY) $^ ../

.PHONY: pdf
pdf:
	make $(MDOCS) $(PDF)

.PHONY: software
software:
	make $(MDOCS) software

.PHONY: submodule
submodule:	$(CONTRIBUTING)
	$(COPY) $(CONTRIBUTING) ../
	make $(MDOCS) submodule
	make $(MLEX) submodule

.PHONY: tidy
tidy:
	make $(MDOCS) tidy
	make $(MLEX) tidy

.PHONY: uninstall
uninstall:
	make $(MLEX) uninstall

################################################################################
