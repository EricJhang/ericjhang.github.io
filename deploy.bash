hexo generate
cp -R public/* .deploy/ericjhang.github.io
cd .deploy/ericjhang.github.io
git add . 
git commit -m "update"
git push origin master