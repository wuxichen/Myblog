---
layout: post
title: Jekyll搭建过程中的Git命令
category: backup
date: 2014-08-27 17:04:00
---

<p>
1. 创建Jekyll的新目录 <br>
2. 初始化：<code>git init</code> <br>
3. 创建分支gh-pages：<code>git checkout --orphan gh-pages</code> <br>
4. 提交到本地git库中： <br>
<code>git add --all . <br>
 git commit  -m "first post"</code> <br>
5. 到github上建同名库“Myblog”：<br> 
<code>git remote add myblog(新的仓库名) https://github.com/(username)/Myblog.git</code> <br>
6. 推送到github上：<code>git push myblog gh-pages</code>

</p>

