@echo off

echo change to "source"
git checkout source

echo commit to local git
git add --all .
git commit -m %1
cp -r _site/ /tmp/

echo change to "gh-pages"
git checkout gh-pages

echo update _site and commit to remote git
rm -r ./*
cp -r /tmp/_site/* ./
git add --all .
git commit -m %1
git push myblog gh-pages

echo change to "source"
git checkout source