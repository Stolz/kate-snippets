#!/bin/sh

die () {
echo >&2 "ERROR: $@"
exit 1
}

[ "$#" -eq 1 ] || die "1 argument required, $# provided"

path="`readlink -f $1`"

[ -f "$path" ] || die "$path File not found!"

kde="$HOME/.kde4/share/apps/ktexteditor_snippets/data"

[ -d "$kde" ] || die "$kde Directory not found!"

cd "$kde"

ln -s "$path" || die "Unable to create symlink!"

exit 0
