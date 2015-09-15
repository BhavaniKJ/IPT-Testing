#!/bin/bash
SCI_PATH="/usr/bin/scilab" #Scilab software location path

process_Scilab()
{
OUTPUT=` timeout 35 $SCI_PATH -nb -nwni -f Test.sce`
echo $OUTPUT
echo "${OUTPUT}" > ./AImread.log
sed -n -E -e '/XXXXXXX/,$ p' AImread.log >>temp
sed 's/\<XXXXXXX\>//g' temp >>PNG_AImread.log
}

echo "Executing..."
process_Scilab
