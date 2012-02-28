#!/bin/bash
if [ $# = 0 ]; then
	echo "Usage: %s translation [reference]" "$0"
elif [ $# = 1 ]; then
	xsltproc --stringparam translation "../../language/${1}/strings.xml" translate.xsl translate.xsl
else
	xsltproc --stringparam translation "../../language/${1}/strings.xml" --stringparam reference "../../language/${2}/strings.xml" translate.xsl translate.xsl
fi
