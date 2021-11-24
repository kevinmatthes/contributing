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
MLEX	:= -C ./.lex/

# Directories.
DOCSDIR	:= ../.docs/
DIRS	:= $(DOCSDIR)

# File types.
YAML	:= $(wildcard ./.docs/*.yaml)

# Concrete files.
CONTRIBUTING	:= ./CONTRIBUTING.md
LSTART			:= ./.docs/license_begin.md
LSTOP			:= ./.docs/license_end.md
META_CONST		:= ./.docs/meta.yaml
NEWPAGE			:= ./.docs/newpage.md
PDF				:= ./contributing.pdf
README			:= ./README.md
LICENSE			:= ./LICENSE
SOFTWARE		:= ./.docs/software_requirements.md
SUPER_SOFTWARE	:= ../.docs/software_requirements.md



##
#
# Build instructions.
#
##

.PHONY: default
default: submodule

$(DIRS):
	$(NEWDIR) $@

.PHONY: lexers
lexers:
	make $(MLEX) lexers

.PHONY: license
license: $(LICENSE)
	$(COPY) $^ ../

$(PDF):	$(CONTRIBUTING) $(LICENSE) $(LSTART) $(LSTOP) $(NEWPAGE) $(README) \
		$(SOFTWARE) $(YAML)
	$(LISTER)	$(YAML)							$(NEWPAGE) \
				$(README)						$(NEWPAGE) \
				$(SOFTWARE)						$(NEWPAGE) \
				$(CONTRIBUTING)					$(NEWPAGE) \
				$(LSTART) $(LICENSE) $(LSTOP)	\
	| $(PANDOC) $(PFLAGS) -o $@

.PHONY: submodule
submodule:	$(CONTRIBUTING) $(DIRS) $(LSTART) $(LSTOP) $(META_CONST) $(NEWPAGE)
	$(COPY)	$(LSTART) $(LSTOP) $(META_CONST) $(NEWPAGE) $(DOCSDIR)
	$(COPY) $(CONTRIBUTING) ../
	make $(MLEX) submodule

$(SUPER_SOFTWARE): $(DIRS) $(SOFTWARE)
	$(COPY) $(SOFTWARE) $(DOCSDIR)

.PHONY: tidy
tidy: $(PDF)
	$(REMOVE) $^
	make $(MLEX) tidy

################################################################################
