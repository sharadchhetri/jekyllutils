#!/bin/bash

#################################################################################
# Author: Sharad Kumar Chhetri							#	
# Blog: http://sharadchhetri.com						#	
# Date: 26-July-2016								#	
# Version: 1.0									#
# Description: The script will help you to quickly create post file in jekyll.  #
# License: GPL v2.0 <https://www.gnu.org/licenses/old-licenses/gpl-2.0.en.html> #
#################################################################################

if [[ $# -ge 1 ]]
then
	echo "HELP: Run the command without any argument, follow the instruction"
exit 0
fi

echo "Write the post title without quotes,followed by [ENTER](For cancle press [CTRL+C]):"
read _posttitle


# Provide absolute path of jekyll project which you have created. Given below is example path so replace it.
_projectpath=/opt/jekyll_blog/example.com

if [ -d "_projectpath" ]
then
	echo "Path not found: $_projectpath"
fi

_postdate=`date +%F`
_postdatetime=`date "+%F %T"`
_titleurl=`echo $_posttitle|tr ' ' '-'|tr -dc '[:alnum:]-' | tr '[:upper:]' '[:lower:]'`
_postfile="$_projectpath/_posts/$_postdate"-"$_titleurl".markdown

if [ -f "$_postfile" ]
then
	echo "File $_postfile already exist"
	exit 0
else

echo "---
layout: post
title:  "\"$_posttitle"\"
date:   $_postdatetime 
categories: jekyll
---
" > "$_postfile"

## After creating post file, vi editor will quickly open the file for editing. 
## You can replace vi with your favourite file editor or disable this section. 
vi "$_postfile"

fi
