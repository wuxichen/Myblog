---
layout: post
title: 【图表展示】JFreeChart画折线图
category: htmlcss
date: 2014-09-01 15:00:00
---

JFreeChart的关键在于其数据集类型的选择，如果是标签类的数据集就采用CategoryDataset，有序数字类的数据集就采用XYSeriesCollection。
更多数据集类型的内容参考如下博客：[JFreeChart 典型数据集设置示例](http://blog.csdn.net/lxrw2002/article/details/1897702)

<br>
#### 1. 选择合适的数据集类型 ####
由于我只需要折线图的横坐标是有序数字，故采用XYSeriesCollection类型。
{% highlight java %}
private XYSeriesCollection dataset;
{% endhighlight %}

<br>
#### 2. 向数据集中加入数据 ####
{% highlight java %}
XYSeries xyseries = new XYSeries("reality");
for (int i = 0; i < horizontal.length; i++ ){
    xyseries.add( horizontal[i], reality[i] );
}
dataset.addSeries(xyseries);
{% endhighlight %}
其中，"reality"是这条数据的名称；horizontal是横坐标的数组；reality数组是该条数据的各个值，作为数据点的纵坐标；最后，通过`addSeries()`函数将该条数据加入到数据集中。

<br>
#### 3. 解决中文乱码问题 ####
这里采用设定主题的方式，设置中文字体解决乱码问题，设置如下：
{% highlight java %}
standardChartTheme standardChartTheme = new StandardChartTheme("CN");       //设置标题字体  
standardChartTheme.setExtraLargeFont(new Font("宋体",Font.BOLD,20));      //设置图例的字体  
standardChartTheme.setRegularFont(new Font("宋体",Font.PLAIN,15));        //设置轴向的字体  
standardChartTheme.setLargeFont(new Font("宋体",Font.PLAIN,15));          //应用主题样式  
ChartFactory.setChartTheme(standardChartTheme);  
{% endhighlight %}

<br>
#### 4. 画图 ####
要画折线图，则采用<span class="redfont">XYLineChart</span>
{% highlight java %}
JFreeChart chart = ChartFactory.createXYLineChart(
        		"图表标题在这里", "横坐标标题", "纵坐标标题", dataset);
{% endhighlight %}
将jfreechart放入java容器组件，并显示：  
{% highlight java %}
ChartFrame chartFrame = new ChartFrame("窗口标题在这里",chart); 
//chart要放在Java容器组件中，ChartFrame继承自java的Jframe类。该第一个参数的数据是放在窗口左上角的，不是正中间的标题。
chartFrame.pack(); 		//以合适的大小展现图形
chartFrame.setVisible(true);	//图形是否可见
{% endhighlight %}

<br>
#### 5. 设置背景色与纵坐标范围（补充） ####
jfree默认的背景色是灰色，看不清折线图，故将其改为白色
{% highlight java %}
XYPlot p = chart.getXYPlot();
p.setBackgroundPaint(ChartColor.WHITE);
p.setRangeGridlinePaint(ChartColor.GRAY);
{% endhighlight %}
纵坐标的范围可以人为设定，如下：
{% highlight java %}
NumberAxis numberaxis = (NumberAxis)p.getRangeAxis();
numberaxis.setAutoTickUnitSelection(false);
numberaxis.setTickUnit(new NumberTickUnit(10));	//设置纵坐标值的间距(10)
numberaxis.setRangeWithMargins(0,100);			//纵坐标值只能是这之间的值(0~100)
{% endhighlight %}