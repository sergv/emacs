#! /usr/bin/env bash
#
# File: clean.sh
#
# Created:  9 January 2022
#

# treat undefined variable substitutions as errors
set -u
# propagate errors from all parts of pipes
set -o pipefail

# clean *EVERYONE*
make extraclean
# find . -name '*.elc' -delete
# rm lisp/loaddefs.el

exit 0

