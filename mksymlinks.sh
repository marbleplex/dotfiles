#!/bin/sh
#日本語
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
# based on the sccipt below
# https://github.com/michaeljsmalley/dotfiles/blob/master/makesymlinks.sh
# http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
# http://dotfiles.github.io/
############################

########## Variables
# list of files/folders to be symlinded in dotdir
dotdir=~/dotfiles                    # dotfiles directory
backdir=${dotdir}/backup

cd $dotdir

########## backup current dotfiles
if [ ! -d $backdir ]
  then
  mkdir "${backdir}"
fi
c_backdir=${backdir}/`date +%Y%m%d%H%m%S` # current dotfiles backup directory
mkdir $c_backdir
files=`find ${dotdir}/* -type f (! -path 'backup')`
for file in $files
do
  srcfile=`echo $file | sed -e "s/^.*dotfiles\///"`
  dot_srcfile=".${srcfile}"
  #srcfile=`echo $file | sed -e 's/dotfiles\//\./'`
  echo $srcfile
  echo $dot_srcfile
  #dstfile="${c_backdir}/ffff"
  #echo cp -p ${srcfile} ${dstfile}
done
exit

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
   # mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    #ln -s $dir/$file ~/.$file
done
