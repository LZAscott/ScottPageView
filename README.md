# ScottPageView

超简单好用的图片轮播框架，两个imageView实现

使用过程中发现bug，请及时反馈，谢谢

实现原理[请看这里](http://blog.csdn.net/u010411521/article/details/51116175)

______

#ScottPageView的优点
1.文件少，代码简洁

2.同时支持本地图片及网络图片

3.自带图片下载与缓存，不依赖任何第三方库

4.性能好，占用内存少，轮播流畅

5.自定义分页控件及图片描述

#如何集成ScottPageView
###导入
######方式一：手动导入
将ScottPageView文件夹中的所有文件添加到项目中


###创建
######方式一：代码创建
1.导入主头文件 ScottPageView.h

2.创建ScottPageView，设置各属性

3.将ScottPageView添加到要展示到view上面

#ScottPageView的常用属性方法

1.imageArray：要轮播的图片数组，可传本地图片或网络图片路径

2.describeArray：图片描述的字符串数组，应与图片顺序对应

3.time：设置每页的停留时间

4.void(^imageClickBlock)(NSInteger index)：图片被点击后要执行的代码

5.clearDiskCache：清除沙盒中的图片缓存





