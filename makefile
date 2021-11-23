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

CC				:= gcc
CONTRIBUTING	:= ./CONTRIBUTING.md
COPY			:= cp
DIRS			:= ../.docs/ ../.lex/
LEXFILES		:= $(wildcard ./.lex/*.l)
LEXERS			:= $(subst ex/,.lex/, $(subst .l,, $(LEXFILES)))
LEX				:= lex
LEXOUT			:= ./lex.yy.c
LICENSE			:= ./LICENSE
LISTER			:= cat
LSTART			:= ./.docs/license_begin.md
LSTOP			:= ./.docs/license_end.md
META_CONST		:= ./.docs/meta.yaml
NEWDIR			:= mkdir
NEWPAGE			:= ./.docs/newpage.md
PANDOC			:= pandoc
PDF				:= ./contributing.pdf
PFLAGS			:= -N
README			:= ./README.md
SOFTWARE		:= ./.docs/software_requirements.md
SUPER_SOFTWARE	:= ../.docs/software_requirements.md
REMOVE			:= rm
YAML			:= $(wildcard ./.docs/*.yaml)



##
#
# Build instructions.
#
##

.PHONY: default
default: submodule
	make tidy

$(DIRS):
	$(NEWDIR) $@

.PHONY: lexers
lexers: $(LEXERS)

$(LEXERS): $(LEXFILES)
	$(foreach lexfile, $^, $(shell $(LEX) $(lexfile) ; $(CC) -lfl $(LEXOUT) \
	-o $(subst ex/,.lex/, $(subst .l,, $(lexfile)))))

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
submodule:	$(CONTRIBUTING) $(DIRS) $(LEXERS) $(LSTART) $(LSTOP) $(META_CONST) \
			$(NEWPAGE)
	$(COPY)	$(LSTART) $(LSTOP) $(META_CONST) $(NEWPAGE) ../.docs/
	$(COPY) $(LEXERS) ../.lex/
	$(COPY) $(CONTRIBUTING) ../

$(SUPER_SOFTWARE): $(DIRS) $(SOFTWARE)
	$(COPY) $(SOFTWARE) ../.docs/

.PHONY: tidy
tidy: $(LEXERS)
	$(REMOVE) $^ $(LEXOUT) $(wildcard ./*.pdf)
