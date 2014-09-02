---
layout: post
title: 【环境搭建】Redhat 5.8系统安装R语言作Arima模型预测
category: timeseries
date: 2014-09-01 17:00:00
---


最近有项目要在服务器上作时间序列预测的工作，采用Arima模型预测，用java调用Arima的R语言命令进行。
本文记录的是在服务器（Red Hat 5.8）上的搭建工作，供参考！

<br>
> #### 1. 安装C compiler ####

<span class="grayfont">
（无用，版本太低，但可作为高版本的基础，否则无编译器的话无法编译高版本）  
1）装gcc：yum install gcc  
2）装f77：yum install gcc-gfortran  
3）装cpp：yum install glibc-headers  
yum install gcc-c++
</span>
--------------------------------
**在装有低版本的gcc情况下，执行如下步骤**  
[（部分参考http://www.tuicool.com/articles/AZvEBr）](（部分参考http://www.tuicool.com/articles/AZvEBr） "参考博客")

1）装M4：
{% highlight bash %}
cd 到M4的文件夹
./configure
make
make install
{% endhighlight %}
2）装GMP：
{% highlight bash %}
cd 到GMP文件夹
./configure --prefix=/usr/local/gmp-4.3.2
make
make install
{% endhighlight %}
3）装MPFR：
{% highlight bash %}
cd 到MPFR的文件夹
./configure --prefix=/usr/local/mpfr-2.4.2 --with-gmp=/usr/local/gmp-4.3.2/
make
make install
{% endhighlight %}
4）装MPC：
{% highlight bash %}
cd 到MPC的文件夹
./configure --prefix=/usr/local/mpc-0.8.1 --with-gmp=/usr/local/gmp-4.3.2/ --with-mpfr=/usr/local/mpfr-2.4.2/ 
make
make install
{% endhighlight %}
5）修改环境变量：
{% highlight bash %}
vi .bash_profile
{% endhighlight %}
文件后面加：
{% highlight bash %}
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/gmp-4.3.2/lib/:/usr/local/mpfr-2.4.2/lib/:/usr/local/mpc-0.8.1/lib/ 
{% endhighlight %}
<span class="redfont">**（令其生效）source .bash_profile**</span>  
6）装gcc：
{% highlight bash %}
cd 到gcc文件夹
./configure --enable-threads=posix --disable-checking --with-gmp=/usr/local/gmp-4.3.2/ --with-mpfr=/usr/local/mpfr-2.4.2/ --with-mpc=/usr/local/mpc-0.8.1/  
make
make install 
{% endhighlight %}
7）若有两个版本的gcc就换成高版本的
mv 重命名
cp 将[<span class="redfont">gcc g++ gcj</span>（cpp c++这两个可以忽略）]复制到 /usr/bin

<br>
> #### 2. 安装R-3.1.1 ####

1）移到R-3.1.1目录下  
2）{% highlight bash %}
yum install readline-devel
yum install libXt-devel
{% endhighlight %}
3）{% highlight bash %}
./configure --prefix=/usr/R-3.1.1 --enable-R-shlib
{% endhighlight %}
4）{% highlight bash %}
make
make install
{% endhighlight %}

<br>
> #### 3. 配置环境变量 ####

1) 打开bash\_profile文件  
{% highlight bash %}
vi .bash_profile
{% endhighlight %}  

2) 在PATH最后加上 `“:$HOME/usr/R-3.1.1/bin”`  

3) 退出vim，并保存  
{% highlight bash %}
source .bash_profile
{% endhighlight %}

<br>
> #### 4. R语言控制台安装完毕，输入命令 ####

1) 终端中输入“R”即可进入R语言控制台

2) 输入如下命令，安装相关工具包：
{% highlight R %}
install.packages("Rserve")
install.packages("TTR")
install.packages("forecast")
{% endhighlight %}

<br>
> #### 5. 运行java程序 ####

1) Java工程中嵌入两个jar包：`REngine.jar` 和 `RserveEngine.jar`

2) 开始运行，启动Rserve
{% highlight R %}
library(Rserve)
Rserve()
{% endhighlight %}

<br>
<br>
附文件下载地址：  
[http://gcc.petsads.us/releases/gcc-4.6.4/gcc-4.6.4.tar.gz](http://gcc.petsads.us/releases/gcc-4.6.4/gcc-4.6.4.tar.gz)
[http://ftp.gnu.org/gnu/m4/m4-1.4.5.tar.gz](http://ftp.gnu.org/gnu/m4/m4-1.4.5.tar.gz) 
[ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2](ftp://gcc.gnu.org/pub/gcc/infrastructure/gmp-4.3.2.tar.bz2) 
[ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz](ftp://gcc.gnu.org/pub/gcc/infrastructure/mpc-0.8.1.tar.gz)    
[ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2](ftp://gcc.gnu.org/pub/gcc/infrastructure/mpfr-2.4.2.tar.bz2) 