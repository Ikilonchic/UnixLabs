#!/bin/bash

if (( $# == 2 ))
    then echo "$1 * $2 = $(($1 * $2))"
else
    echo "Not enough args!"
fi
