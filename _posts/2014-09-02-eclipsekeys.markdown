---
layout: post
title: Eclipse 常用快捷键
category: backup
date: 2014-09-02 13:00:00
---

本文总结了Eclipse常用的快捷键，作为备忘，这些能够有效地提高编码效率。
<br>
> ### 1. 极其常用快捷键 ###

**Alt + /**	&emsp;&emsp;&emsp;此快捷键为用户编辑的好帮手，能为用户<span class="redfont">提供内容的辅助</span>，不要为记不全方法和属性名称犯愁  
**Ctrl + /**	&emsp;&emsp;&emsp;<span class="redfont">快速添加注释</span>，能为光标所在行或所选定行快速添加注释或取消注释  
**Ctrl + Shift + /**	&emsp;&emsp;&emsp;在代码窗口中是这种<code>/\*注释\*/</code><span class="redfont">注释</span>，在JSP文件窗口中是<code>< ! -- 注释 -- ></code>  
**Ctrl + D**	&emsp;&emsp;&emsp;<span class="redfont">删除当前行</span>，不用为删除一行而按那么多次的删除键  
**Ctrl + Shift + F**	&emsp;&emsp;&emsp;<span class="redfont">格式化代码</span>，选定后按Ctrl+Shift+F快捷键可以格式化这段代码，如果不选定代码则默认格式化当前文件（Java文件）  

<br>
**Alt + ← & Alt + →**	&emsp;&emsp;&emsp;<span class="redfont">后退历史记录和前进历史记录</span>，在跟踪代码时非常有用，用户可能查找了几个有关联的地方，但可能记不清楚了，可以通过这两个快捷键定位查找的顺序  
**Ctrl + Q**	&emsp;&emsp;&emsp;<span class="redfont">回到最后一次编辑的地方</span>，这个快捷键也是当你在代码中跳转后用的  
**Ctrl + . & Ctrl + 1**		&emsp;&emsp;&emsp;<span class="redfont">下一个错误及修改建议</span>&nbsp;Ctrl + . 将光标移动至当前文件中的下一个报错处或警告处，一般与ctrl+1一并使用，即修改建议的快捷键  
**Alt + 上下键**		&emsp;&emsp;&emsp;这个组合将<span class="redfont">当前行的内容往上或下移动</span>。在try/catch部分，这个快捷方式尤其好使  
**Ctrl + Alt + 上下键**		&emsp;&emsp;&emsp;这个组合将<span class="redfont">当前行的内容复制后往上或下移动</span>  
**Shift + Enter & Ctrl + Shift + Enter**	&emsp;&emsp;&emsp;Shift + Enter在<span class="redfont">当前行之下创建一个空白行</span>，与光标是否在行末无关；Ctrl + Shift + Enter则在<span class="redfont">当前行之前插入空白行</span>  
**Ctrl + 2**  
&emsp;&emsp;&emsp;&emsp;**+ L**		&emsp;&emsp;<span class="redfont">为本地变量赋值</span>，开发过程中，常常先编写方法，如<code>Calendar.getInstance()</code>，然后通过 Ctrl + 2 + L 快捷键将方法的计算结果赋值于一个本地变量之上，如下所示：  
{% highlight java %}
Canlendar can = Canlendar.getInstance();
{% endhighlight %}   
&emsp;&emsp;&emsp;&emsp;**+ F**		&emsp;&emsp;<span class="redfont">为类成员变量赋值</span>，把方法的计算结果赋值于类中的域（成员变量）：
{% highlight java %}
private Canlendar can;  
can = Canlendar.getInstance();
{% endhighlight %}
&emsp;&emsp;&emsp;&emsp;**+ R**		&emsp;&emsp;<span class="redfont">重命名光标所在的同名变量</span>  
**Ctrl + E**	&emsp;&emsp;&emsp;<span class="redfont">快速转换编辑器</span>，在打开的编辑器之间浏览。使用**Ctrl + PageDown**或**Ctrl + PageUp**可以浏览前后的选项卡，但是在很多文件打开的状态下，Ctrl + E会更加有效率  
**Ctrl + M**	&emsp;&emsp;&emsp;编辑器<span class="redfont">窗口最大化</span>的快捷键

<br>
> ### 2. 查找定位快捷键 ###

**Ctrl + K & Ctrl + Shift + K**		&emsp;&emsp;&emsp;<span class="redfont">快速向下和向上查找选定的内容</span>，从此不再需要用鼠标单击查找对话框了  
**Ctrl + Shift + T**		&emsp;&emsp;&emsp;<span class="redfont">查找</span>工作空间构建路径中的可找到<span class="redfont">Java类文件</span>，而且可以使用"\*", "?"等通配符  
**Ctrl + Shift + R**		&emsp;&emsp;&emsp;和Ctrl+Shift+T对应，<span class="redfont">查找</span>工作空间中的<span class="redfont">所有文件（包括Java文件</span>，也可以使用通配符  
**Ctrl + Shift + G**		&emsp;&emsp;&emsp;<span class="redfont">查找类、方法和属性的引用</span>，这是一个非常实用的快捷键，例如要修改引用某个方法的代码，可以通过该快捷键迅速定位所有引用此方法的位置  
**Ctrl + L**	&emsp;&emsp;&emsp;<span class="redfont">定位到当前编辑器的某一行</span>，对非Java文件也有效  

<br>
> ### 3. 申明调用导入快捷键 ###

**Ctrl + O**		&emsp;&emsp;&emsp;显示类中<span class="redfont">方法和属性的大纲</span>，能快速定位类的方法和属性，在查找Bug时非常有用  
**F3**		&emsp;&emsp;&emsp;选中代码中的一个方法<span class="redfont">打开申明</span>，或者，利用Declaration Tab（在Java视图模式下，选择Windows --> Show View -- > Declaration）  
**Ctrl + Shift + G**		&emsp;&emsp;&emsp;在workspace中搜索引用（作用和F3恰好相反）。它使你在方法的栈中，向上找出一个方法的<span class="redfont">所有调用者</span>  
**Ctrl + Alt + H**			&emsp;&emsp;&emsp;显示出这个方法<span class="redfont">被哪些方法调用</span>，最终产生一个调用关系树  
**Ctrl + Shift + M**		&emsp;&emsp;&emsp;（先把光标放在需导入包的类名上）作用是<span class="redfont">加Import语句</span>  
**Ctrl + Shift + O**		&emsp;&emsp;&emsp;作用是<span class="redfont">缺少的Import语句被加入，多余的Import语句被删除</span>

