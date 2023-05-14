#!/bin/bash

set -e

JSON_FILES=$(find . -name \*.json)
for f in $JSON_FILES
do
  echo "Verifying $f file..."
  jq '.' $f 1> /dev/null
done
echo $'All JSON files verified..\n'

CSV_FILES=$(find . -name \*.csv)
for f in $CSV_FILES
do
  echo "Verifying $f file..."
  csvlook $f 1> /dev/null
done
echo $'All CSV files verified..\n'

XML_FILES=$(find . -name \*.xml)
for f in $XML_FILES
do
  echo "Verifying $f file..."
  xmllint $f 1> /dev/null
done
echo $'All XML files verified..\n'

echo "All input/output files lint check passed (SUCCESS)"
