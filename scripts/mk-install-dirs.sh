#! /usr/bin/env sh
# mkinstalldirs --- make directory hierarchy
# Author: Noah Friedman <friedman@prep.ai.mit.edu>
# Created: 1993-05-16
# Public domain

# $Id: mkinstalldirs,v 1.1 2003/09/09 22:24:03 mhampton Exp $

errstatus=0

for file
do
   set fnord `echo ":$file" | sed -ne 's/^:\//#/;s/^://;s/\// /g;s/^#/\//;p'`
   shift

   pathcomp=
   for d
   do
     pathcomp="$pathcomp$d"
     case "$pathcomp" in
       -* ) pathcomp=./$pathcomp ;;
     esac

     if test ! -d "$pathcomp"; then
        echo "mkdir $pathcomp" 1>&2

        mkdir "$pathcomp" || lasterr=$?

        if test ! -d "$pathcomp"; then
          errstatus=$lasterr
        fi
     fi

     pathcomp="$pathcomp/"
   done
done

exit $errstatus

# mkinstalldirs ends here
