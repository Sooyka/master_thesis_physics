#!/bin/bash


chapter_title=${1}

mkdir "../${chapter_title}"
touch "./TeX_files/${chapter_title}.tex"

chapter_title_no_underscores=$(echo ${chapter_title} | sed 's/_/ /g')
echo -e "% mainfile: ../master_thesis_GW.tex\n\\\chapter{${chapter_title_no_underscores}}" > "./TeX_files/${chapter_title}.tex"

ln -s "../LaTeX/TeX_files/${chapter_title}.tex" "../${chapter_title}/${chapter_title}.tex"
echo "\\input{\"./TeX_files/${chapter_title}.tex\"}"

git_ignore_symlinks.sh
