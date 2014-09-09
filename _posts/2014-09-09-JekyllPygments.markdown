---
layout: post
title: 【环境搭建】Jekyll中采用Pygments实现语法高亮
category: backup
date: 2014-09-09 15:00:00
---

<br>
&emsp;&emsp;	Pygments可以实现多种代码语法的高亮，在搭建Jekyll博客的过程中，可以利用python setuptools安装，比较方便。但在安装过程中会有`UnicodeDecodeError`错误，解决方法可见本文第一部分。  
&emsp;&emsp;	本机环境：Windows 7 64位操作系统，python 2.7（32位），Jekyll 2.3.0  
<br>
> ### 1. 安装 setuptools ###

1) 下载"ez\_setup.py"，网址为：[https://pypi.python.org/pypi/setuptools#windows-7-or-graphical-install](https://pypi.python.org/pypi/setuptools#windows-7-or-graphical-install)  
2) 此时，用运行该脚本<code>python ez_setup.py</code>，会出现错误：  
`UnicodeDecodeError: 'ascii' codec can't decode byte 0xb3 in position 3: ordinal not in range(128)`  
&emsp;&emsp;	解决方法：根据错误提示，找到python的lib目录中<codde>mimetypes.py</code>文件，并在其中找到如下代码，并修改，之后再次运行即可通过。
{% highlight python %}
default_encoding = sys.getdefaultencoding()

# 将该行代码改为：默认编码采用GBK而非UTF8
# default_encoding = sys.getdefaultencoding()
if sys.getdefaultencoding() != 'gbk':
	reload(sys)
	sys.setdefaultencoding('gbk')
	default_encoding = sys.getdefaultencoding()
{% endhighlight %}

<br>
> ### 2. 安装 Pygments ###

&emsp;&emsp;	安装完setuptools之后，保证环境变量中包含Python的Script文件夹（路径），运行命令：`easy_install Pygments`，即可安装Pygments。

<br>
> ### 3. 使用Pygments实现语法高亮 ###

&emsp;&emsp;	Pygments提供了多种样式，可以在Pygments官网的Demo中选择某种语言的例子，体验不同的样式。另外，通过下面的命令可以查看当前支持的样式：
{% highlight python %}
from pygments.styles import STYLE_MAP
STYLE_MAP.keys()
{% endhighlight %}
&emsp;&emsp;	选择一种样式，如native，运行如下命令，生成样式文件pygments.css，并将其包含进网站样式表中。
{% highlight bash %}  
pygmentize -S native -f html > pygments.css
{% endhighlight %}