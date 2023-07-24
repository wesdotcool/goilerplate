#! /bin/env sh

if [ $# -eq 0 ]
then
    echo "Invalid params. Please supply new project name. Ex:"
    echo "  source rename.sh mygoproject"
    return 1
fi

currentdir=${PWD##*/}
currentdir=${currentdir:-/}
if [ "$currentdir" = "/" ]
then
    echo "Cannot operate in /"
    return 1
fi
if [ -d "../$1" ]
then
    cd ..
    echo "Invalid name: \"$1\" $(pwd)/$1 already exists"
    cd $currentdir
    return 1
fi

echo "Renaming Go project and directory to $1"
cd ..
cp -r $currentdir $1
cd $1
find . -type f -regex '^./[^.].*' | xargs sed -i '.bak' -e "s/goilerplate/$1/g"
rm -f *.bak
rm -f */*.bak
rm -f rename.sh

echo "===================================================="
echo "Successfully renamed 'goilerplate' to '$1'. Be aware YOUR DIRECTORY HAS CHANGED"
echo "You can see the changes made by running 'git status'"
echo "Please consider updating git remotes with:"
echo "  git remote remove origin"
echo "  git remote add origin https://github.com/<USERNAME>/$1.git"
echo "Don't forget to update the README (^_^)"
