#!/bin/sh

# Macros in shell!
# These are blocks that're executed in the same context as the current block.
# They cannot take arguments, but it works fine for menial stuff, such as setting a variable to $1, then immediately shifting.

defmacro () {
    body=;
    while read -r line; do
        body="$body; $line"
    done
    export "${1}body=$body"
    alias $1="eval \$${1}body"
    unset body
}

alias macro="defmacro << 'orcam'"
