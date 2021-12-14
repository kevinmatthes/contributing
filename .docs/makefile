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

# Directories.
SUBMODDIR	:= ../../.docs/
DIRS		:= $(SUBMODDIR)

# File types.
MARKDOWN	:= $(wildcard ./*.md)
YAML		:= $(wildcard ./*.yaml)

# Concrete files.
CONTRIBUTING	:= ../CONTRIBUTING.md
LICENSE			:= ../LICENSE
LSTART			:= ./license_begin.md
LSTOP			:= ./license_end.md
META_CONST		:= ./meta.yaml
NEWPAGE			:= ./newpage.md
PDF				:= ./documentation.pdf
README			:= ../README.md
SELF			:= ./makefile
SOFTWARE		:= ./software_requirements.md



##
#
# Build instructions.
#
##

.PHONY: default pdf software submodule tidy

default: $(PDF)

$(DIRS):
	$(NEWDIR) $@

pdf: $(PDF)

$(PDF): $(CONTRIBUTING) $(LICENSE) $(MARKDOWN) $(README) $(YAML)
	$(LISTER)	$(YAML) $(NEWPAGE) $(README) $(NEWPAGE) $(SOFTWARE) $(NEWPAGE) \
				$(CONTRIBUTING) $(NEWPAGE)  $(LSTART) $(LICENSE) $(LSTOP)      \
	| $(PANDOC) $(PFLAGS) -o $@

software: $(SOFTWARE) $(SUBMODDIR)
	$(COPY) $(SOFTWARE) $(SUBMODDIR)

submodule: $(LSTART) $(LSTOP) $(META_CONST) $(NEWPAGE) $(SELF) $(SUBMODDIR)
	$(COPY) $(LSTART) $(LSTOP) $(META_CONST) $(NEWPAGE) $(SELF) $(SUBMODDIR)

tidy: $(PDF)
	$(REMOVE) $^

################################################################################
