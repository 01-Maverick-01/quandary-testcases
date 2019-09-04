#!/bin/bash

export JFLEX_DIR=$HOME/jflex-1.7.0
export CUP_DIR=$HOME/cup

ROOTDIR=$1
QUAND_REF_DIR="$ROOTDIR/quandary-ref"
SKELETON_REF_DIR="$ROOTDIR/quandary-skeleton"

echo "<Running Ref interpretor>"
java -cp "$QUAND_REF_DIR/java-cup-11b-runtime.jar:$QUAND_REF_DIR/quandary-obfuscated.jar" -ea interpreter.Interpreter $2 $3
echo Quandary process returned $?

echo "<Running skeleton interpretor>"
java -cp "$CUP_DIR/java-cup-11b-runtime.jar:$SKELETON_REF_DIR" -ea interpreter.Interpreter $2 $3
echo Quandary process returned $?
