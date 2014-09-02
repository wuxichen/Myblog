---
layout: post
title: 微博人人开放平台授权
category: php
date: 2014-09-01 13:00:00
---


这里以人人网为例子，新浪微博的几乎一样。
附\_官方指南：
人人网：[人人网开放平台官方指南](http://wiki.dev.renren.com/wiki/Authentication)
微博：[新浪微博开放平台官方指南](http://open.weibo.com/wiki/授权机制#Web.E5.BA.94.E7.94.A8.E7.9A.84.E9.AA.8C.E8.AF.81.E6.8E.88.E6.9D.83)

### 授权验证步骤 ###

1. 首先要申请开放平台的**API Key** 和 **API Secret**，指南里有申请步骤

2. 让用户点击以下地址连接（红色记号为自定部分）：
https://graph.renren.com/oauth/authorize?client\_id=<span class="redfont">API Key</span>&redirect\_uri=<span class="redfont">http://127.0.0.1/test/get.php（转向地址,下一步创建这个文件）</span>&response\_type=code

3. 在test目录下创建get.php文件，主要内容：  
1) 利用code才能获得access\_token： `$code = $_GET['code'];`   
2) 以下是获取Access\_Token的连接：  
$url = 'https://graph.renren.com/oauth/token?grant\_type=authorization\_code&client\_id=<span class="redfont">API Key</span>&redirect\_uri=<span class="redfont">http://127.0.0.1/test/get.php（同样是转向地址，自身文件就行）</span>&client\_secret=<span class="redfont">API Secret</span>&code='.<span class="redfont">$code（3.1中的code）</span>;  
3) 用PHP的file\_get\_contents传递POST请求给$url，代码如下：  
 {% highlight PHP %}
$options = array( 'http' => array( 'method' => 'POST', 'header' => 'Content-type:application/x-www-form-urlencoded' ) ); 
$content = stream_context_create( $options ); 
$result = file_get_contents( $url, false, $content ); 
$result = json_decode( $result );
{% endhighlight %}
此时的`$result`就含有'access\_token', 'refresh\_token'等，直接`$result['access_token']`可以获取。  

<br>
> #### Notice： ####

1. <code>“Warning: file\_get\_contents(): Unable to find the wrapper "https" - did you<br> forget to enable it when you configured PHP?...”</code>  
这个错误，需要将php.ini中的"extension=php\_openssl.dll"去掉前面的“;”  

2. <code>“Warning: file\_get\_contents(https://graph.renren.com/oauth/token?.....): <br>failed to open stream: HTTP request failed! HTTP/1.1 401 Unauthorized”</code>  
这个错误，网上有很多种说法，比如开远程访问、user\_agent设为firefox浏览器之类的，在我机子上这些设置无论开启与否都无影响，只是注意一点，也是我错的地方，$url中的地址不能有换行；

3. 另外就是转向地址本机写localhost识别不了还得写127.0.0.1

4. 在抓取用户数据的时候，需要注意应用如果是没审核的状态一些API只能用于测试用户（这个再应用的界面可以设置），如果抓非测试用户的话会出现“Invalid Access Token”的错误，非常坑爹。。

好了，之后就可以抓数据了~祝大家好运~