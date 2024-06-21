#!/bin/bash

rm -rf tmp
mkdir -p tmp
FACPATH="Library/Application Support/factorio/mods"
cp ~/"$FACPATH"/space-exploration_*.zip ./tmp/
cp ~/"$FACPATH"/robot_attrition_*.zip ./tmp/
pushd tmp
unzip "*.zip"
rm *.zip
pushd
patch < patches/easygame.patch
pushd
for dir in */; do
    zip -r "${dir%/}.zip" "$dir"
done
cp -v *.zip ~/"$FACPATH"/
pushd
rm -rf tmp