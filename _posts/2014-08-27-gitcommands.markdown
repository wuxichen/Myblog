---
layout: post
title: Git常用命令总结
category: backup
date: 2014-08-27 19:04:00
---

## 目录 ##

<span style="line-height: 30px;">
<a href="#t1">1. Git创建及初始化: clone, init, remote</a>  
<a href="#t2">2. 仓库中的文件操作: add, rm</a>  
<a href="#t3">3. 提交修改内容: comit</a>  
<a href="#t4">4. 与远程仓库的交互通信: push, pull, fetch, merge, diff</a>  
<a href="#t5">5. 版本标签操作相关命令: tag</a>  
<a href="#t6">6. 分支操作相关命令: branch</a>  
<a href="#t7">7. 查看日志状态: log, show, status</a>  
<a href="#t8">8. 版本库还原回退: reset, revert, rebase</a>  
</span>

------------------
<br>
> <a name="t1"></a><h3>1. Git创建及初始化</h3>

<h4>1) git clone</h4>
当有一个远程的Git版本库，可以用这种方法在本地克隆一份进行初始化
{% highlight python %}
F:> git clone git://github.com/username/remote_project.git local_project
{% endhighlight %}
上面的命令就是将'git://github.com/username/remote\_project.git'这个URL地址的远程版本库，完全克隆到本地F:/local\_project目录下  

<br>
<h4>2) git init 和 git remote</h4>

- 当本地创建了一个工作目录，进入这个目录，使用<code>git init</code>命令进行初始化；
- Git以后就会对该目录下的文件进行版本控制，这时候如果你需要将它放到远程服务器上，可以在远程服务器上创建一个目录，并把可访问的URL记录下来，此时可以利用<code>git remote add</code>命令来增加一个远程服务器端。
{% highlight python %}
git remote add remote_name git://github.com/username/another_project.git
{% endhighlight %}
上面的命令就会增加名为remote\_name并且其URL地址为'git://github.com/username/another\_project.git'的远程仓库，以后提交代码的时候只需要使用remote\_name别名即可
 
<br>
> <a name="t2"></a><h3>2. 仓库中的文件操作</h3>

<h4>1) git add 添加文件</h4>
将当前更改或者新增的文件加入到Git的索引中，加入到Git的索引中就表示记入了版本历史中，这也是提交之前所需要执行的一步
{% highlight python %}
git add dir1    # 添加dir1这个目录，目录下的所有文件都被加入
git add f1 f2   # 添加f1，f2文件
git add .       # 添加当前目录下的所有文件和子目录
{% endhighlight %}  

<br>
<h4>2) git rm 删除文件</h4>
从当前的工作空间中和索引中删除文件
{% highlight python %}
git rm f     # 删除f(与add一样)
{% endhighlight %}

<br>
<h4>3) 忽略特定文件</h4>
在仓库根目录下创建名称为“.gitignore”的文件，写入不需要的文件夹名或文件，每个元素占一行即可

<br>
> <a name="t3"></a><h3>3. 提交修改内容</h3>

提交当前工作目录的修改内容，可以直接调用<code>git commit</code>命令，通过如下方式在命令行就填写提交注释：
{% highlight python %}
git commit -m "这里填写提交注释"
{% endhighlight %}

git commit 命令的-a选项可只将所有被修改或者已删除的且已经被git管理的文档提交倒仓库中。如果只是修改或者删除了已被Git管理的文档，是没必要使用git add 命令的。
{% highlight python %}
git commit -a -m "提交的描述信息"
{% endhighlight %}

<br>
> <a name="t4"></a><h3>4. 与远程仓库的交互通信</h3>

<h4>1) git push 远程推送</h4>
将本地commit的代码更新到远程版本库中：
{% highlight python %}
git push remote_name (local_branch:)remote_branch     # 提交本地local_branch分支作为远程的remote_branch分支，括号部分作为当前目录可以省略
{% endhighlight %}
以上命令会将本地local\_branch的代码更新到名为remote\_name的远程版本库中，远程分支名为remote\_branch。
另外，如果想要覆盖远程版本中的代码，则用<code>git push -f ...</code>

<br>
#### 2) git pull 版本库获取并尝试合并到本地 ####
从其他的版本库（既可以是远程的也可以是本地的）将代码更新合并到本地。其结果相当于`git fetch和git merge`，建议采用这个组合。
{% highlight python %}
git pull remote_name local_branch
{% endhighlight %}
以上命令就是将remote\_name这个版本库的代码更新到本地的local\_branch分支上。

<br>
#### 3) git fetch + merge 版本库获取与合并 ####
- `git fetch` 会使本地版本库与另一版本库同步，提取本地所没有的数据，为你在同步时的该远端的每一分支提供书签。
{% highlight python %}
git fetch remote_name remote_branch		# remote_branch省略时则抓取remote_name的所有分支
{% endhighlight %}
该命令能够把remote\_name版本库（的remote\_branch分支）数据抓取到本地。

- `git merge` 能够将任何分支合并到当前分支中去
{% highlight python %}
git merge "这里填写合并注释" local_branch remote_branch
{% endhighlight %}

<br>
#### 4) git diff 代码不同处比较（便于上一步的合并） ####
`git diff` 把本地的代码尚未缓存的代码进行比较
{% highlight python %}
git diff 			# 尚未缓存(index)的修改
git diff --cached 	# 已经缓存的修改
git diff HEAD	
	
git diff --stat 		# 查看简单的diff结果
git diff --stat branch1 branch2		# 查看branch1和branch2的差别
{% endhighlight%}

区别说明：

- `git diff` 此命令比较的是工作目录(Working tree)和暂存区域快照(index)之间的差异
也就是修改之后还没有暂存起来的变化内容；
- `git diff --cached` 查看已经暂存起来的文件(index)和上次提交时的快照之间(HEAD)的差异；
- `git diff HEAD` 查看工作目录(Working tree)和上次提交时的快照(HEAD)的差异；

<br>
<a name="t5"></a> 
> ### 5. 版本标签操作相关命令 ###

#### 1) 本地版本标签操作 ####
- 查看版本：`$ git tag`
- 创建版本：`$ git tag [name]`
- 删除版本：`$ git tag -d [name]`

<br>
#### 2) 远程版本标签操作 ####

- 查看远程版本：`$ git tag -r`
- 创建远程版本(本地版本push到远程)：`$ git push origin [name]`
- 删除远程版本：`$ git push origin :refs/tags/[name]`
- 合并远程仓库的tag到本地：`$ git pull origin --tags`
- 上传本地tag到远程仓库：`$ git push origin --tags`
- 创建带注释的tag：`$ git tag -a [name] -m 'yourMessage'`

<br>
<a name="t6"></a>
> ### 6. 分支操作相关命令 ###

#### 1) 本地分支操作 ####
- 查看本地分支：`$ git branch`
- 创建本地分支（新分支创建后不会自动切换为当前分支）：`$ git branch [name]`
- 创建新分支并立即切换到新分支：`$ git checkout -b [name]`
- 切换分支：`$ git checkout [name]`
- 删除分支（d选项只能删除已经参与了合并的分支，对于未有合并的分支是无法删除的。如果想强制删除一个分支，可以使用-D选项）：`$ git branch -d [name]`
- 合并分支（与当前分支合并）：`$ git merge [name]`

<br>
#### 2) 远程分支操作 ####
- 创建远程分支(本地分支push到远程)：`$ git push origin [name]`
- 删除远程分支：`$ git push origin :heads/[name]` 或 `$ git push origin :[name]` 
- 查看远程分支：`$ git branch -r`
 
<br>
<a name="t7"></a>
> ### 7. 查看日志状态  ###

#### 1) git log 显示分支中的更改记录 ####
某分支的按时间排序的列表，当处于该分支时，可以执行`git log`以查看。
{% highlight python %}
git log
git log -oneline		# 紧凑显示
git log -oneline -graph		# 显示拓扑图，查看历史中什么时候出现了分支、合并
{% endhighlight %}
当需要过滤一些提交记录时可以采用如下的命令：

- 只寻找某个特定作者的提交 `--author`
- 根据日期过滤提交记录 `git log –-since –-before`
- 根据提交注释过滤提交记录 `git log –-grep`

{% highlight python %}
git log --author=user			# 只显示user作者的提交
git log --before={3.weeks.ago} --after={2010-04-18}	--no-merges	# 只显示3周前到2014.4.18的提交（no-merges代表不显示合并提交）
git log --grep="p4 depo"			# 查找注释内容含有 “p4 depo”的提交
{% endhighlight %}

<br>
#### 2) git show 显示具体修改 ####
{% highlight python %}
git show [SHA1]		
git show HEAD^n		# 前第n次的提交
{% endhighlight %}
以上命令显示提交版本号为'SHA1'的详细修改信息，版本号可以通过`git log`的前面一串字符获得。

<br>
#### 3) git status 查看状态 ####
采用`git status -s`查看当前简短状态，没有`-s`则信息比较全面

<br>
<a name="t8"></a>
> ### 8. 版本库还原回退 ###

#### 1) git reset ####
可参考例子[http://guibin.iteye.com/blog/1014369](http://guibin.iteye.com/blog/1014369 "Git reset 实例")  
将当前的分支重设到指定的版本或者HEAD（默认，如果不显示指定commit，默认是HEAD，即最新的一次提交），并且根据[mode]有可能更新index和working directory。  
mode的取值可以是hard、soft、mixed、merged、keep，前三者较为常用，下面将详细说明：

- `--hard`：重设index和working directory，自从<commit>以来在working directory中的任何改变都被丢弃，并把HEAD指向<commit>；
{% highlight python %}
git reset --hard HEAD~3		# 删除最近的三个commit，将HEAD指向HEAD~3
{% endhighlight %}
- `--soft`：index和working directory中的内容不作任何改变，仅仅把HEAD指向<commit>。<commit>之后的修改内容属于尚未提交的，这时`git commit -m`之后可以重新提交。这个模式的效果是，执行完毕后，自从<commit>以来的所有改变都会显示在git status的"Changes to be committed"中。
- `--mixed`：**（默认模式）**仅重置index，但是不重置working directory。这个模式的效果是，working directory中文件的修改都会被保留，不会丢弃，但是也不会被标记成"Changes to be committed"，但是会打出什么还未被更新的报告。

<br>
#### 2) git revert ####
用于回滚一些commit。对于一个或者多个已经存在的commit，去除由这些commit引入的改变，并且用一个新的commit来记录这个回滚操作。这个命令要求working tree必须是干净的。  
git revert用于用一个commit来记录并回滚早前的commit，经常是一些错误的提交。如果你想干脆扔掉working tree中的东西，可以使用`git reset --hard `。
{% highlight python %}
git revert HEAD~3	
# 丢弃最近的三个commit，把状态恢复到最近的第四个commit，并且提交一个新的commit来记录这次改变。 
git revert -n master~5..master~2		
# 丢弃从最近的第五个commit（包含）到第二个（不包含）,但是不自动生成commit，这个revert仅仅修改working tree和index
{% endhighlight %}

**git revert 和 git reset的区别** 
 
- `git revert`是用一次新的commit来回滚之前的commit，`git reset`是直接删除指定的commit。  
- 在回滚这一操作上看，效果差不多。但是在日后继续merge以前的老版本时有区别。因为`git revert`是用一次逆向的commit“中和”之前的提交，因此日后合并老的branch时，导致这部分改变不会再次出现，但是`git reset`是之间把某些commit在某个branch上删除，因而和老的branch再次merge时，这些被回滚的commit应该还会被引入。 
- `git reset`是把HEAD向后移动了一下，而`git revert`是HEAD继续前进，只是新的commit的内容和要revert的内容正好相反，能够抵消要被revert的内容。 

<br>
#### 3) git rebase ####
该命令就是重新定义（re）起点（base）的作用，即重新定义分支的版本库状态。要搞清楚这个东西，要先看看版本库状态切换的两种情况：

- 我们知道，在某个分支上，我们可以通过上面介绍的`git reset`，实现将当前分支切换到本分支以前的任何一个版本状态，即所谓的“回溯”。即实现了本分支的“后悔药”。也即版本控制系统的初衷。
- 还有另一种情况，当我们的项目有多个分支的时候。我们除了在本地开发的时候可能会“回溯”外，也常常会将和自己并行开发的别人的分支修改包含到自己本地来。

[http://blog.csdn.net/lihaoweiv/article/details/7740031](http://blog.csdn.net/lihaoweiv/article/details/7740031 "rebase")
[http://www.cnblogs.com/dabaopku/archive/2012/06/24/2559652.html](http://www.cnblogs.com/dabaopku/archive/2012/06/24/2559652.html "rebase2")


