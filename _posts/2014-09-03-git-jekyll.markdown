---
layout: post
title: Jekyll搭建过程中的Git命令
category: backup
date: 2014-09-03 17:00:00
---

<br>
> ### 搭建环境，推送至Github ###

1. 创建Jekyll的新目录 <br>
2. 初始化：<code>git init</code> <br>
3. 创建分支gh-pages：<code>git checkout --orphan gh-pages</code> <br>
4. 提交到本地git库中： <br>
<code>git add --all . <br>
 git commit  -m "first post"</code> <br>
5. 到github上建同名库“Myblog”：<br> 
<code>git remote add myblog(新的仓库名) https://github.com/(username)/Myblog.git</code> <br>
6. 推送到github上：<code>git push myblog gh-pages</code>

<br>
> ### 解决插件禁用问题 ###

&emsp;&emsp;  Jekyll提供了插件功能，在网站源代码目录下，有一个名为<code>\_plugins</code>的目录，可以将一些插件放进去，这样，Jekyll在解析网站源代码时，就会运行其中的插件。例如我的博客中用到的分类功能，就是利用一项插件而得到的。  
&emsp;&emsp;  在本地运行Jekyll时，这些插件会自动被调用，但是GitHub在解析网站源代码时，出于安全考虑，会开启安全模式，禁用这些插件。此时，GitHub为我们提供了另一种解析网站的方式，那就是直接上传最终的静态网页。这样，我们可以在本地使用Jeklly把网站解析出来，然后再上传到GitHub上， 这就使得我们既使用了插件，又使用了 GitHub。   
&emsp;&emsp;  要想实现这一效果，<span class="redfont">我们需要维护两个分支，一个是网站的源代码分支，另一个是Jeklly 解析源代码后生成的静态网站</span>。   
&emsp;&emsp;  例如，我的源代码分支名为<code>source</code>，静态网站分支名为<code>gh-pages</code>。平时写博客时，首先在<code>master</code>分支下，添加新文章，然后本地使用<code>jekyll build</code>将添加文章后的网站解析一次，这时<code>\_site</code>目录下就有新网站的静态代码了。然后把这个目录下的所有内容复制到<code>gh-pages</code>分支下。以下为脚本命令：   
{% highlight bash %}
git checkout source
git add --all .
git commit -m "deploy blog"
cp -r _site/ /tmp/
git checkout gh-pages
rm -r ./*
cp -r /tmp/_site/* ./
git add --all .
git commit -m "deploy blog"
git push origin gh-pages
git checkout source
{% endhighlight %}
