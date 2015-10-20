# ESFrameWork
###### 快速创建唱吧,百度糯米,内涵段子,不得姐等主流APP架构,封装了底部TabBarItem和顶部TitleButton

### 上传原因:
+ 最近接触的几款APP中,都有类似于唱吧,内涵段子底部的TabBar
以及百思不得姐页面顶部的TitleButton,又研究了下别的几款APP,也有这种风格的东东,既然遇到了,就一不做二不休,直接抽出来,下次再有类似需求,直接拿来用

### 功能:
+ 自定义TabBar:
	+ 以前的一些需求中,可能直接就底部四个TabBar,如果我们想再加入一个和另外四个不一样的TabBar,此时再使用系统自带的TabBar并不能满足我们的需求

+ 统一处理子界面返回键文字:
	+ 当APP中有多个页面的时候,我们从NavigationController再push一个子页面的时候,返回键的文字不能统一处理


+ 自定义控制器顶部TitleButton:
	+ 可能我们会遇到的需求有,要创建多个TitleButton来展现APP一类的功能,比如说新闻中的各类新闻等.

### 效果图:
![](http://i11.tietuku.com/9cc647610d5d60f2.gif)

### 针对上述三个功能的实现思路(实现步骤请参考代码)

+ 自定义自定义TabBar
	要实现这个特殊的TabBar,首先想到的是翻文档,我们找到了API中确实有tabBar这个属性,好激动...
```
@property(nonatomic,readonly) UITabBar *tabBar;
```
但是它是只读的!如果一定要是使用这个属性我们可以使用KVC来进行赋值,新建ESTabBar来继承UITabBar,在ESTabBar对tabBar进行处理,之后....在加载控制器的时候将他们呢单独调用即可.

```
[self setValue:[[ESTabBar alloc]() init] forKey:@"tabBar"];
```
+ 统一处理子界面返回键文字
如效果图所示,我们要从每个控制器的子控制器中返回到当前控制器,为了APP界面风格的统一,可能要统一处理返回键上的文字和展示效果,这里大致说下思路,我们每次进去的到子控制器的时候,都是push进去的,那么猜想push应该是有一个过程的,如果我们能拦截到push的过程,是否可以在拦截过程的时候统一设置?经过查找,发现了

```
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated;
```
我们可以重写这个方法,来拦截push的过程,拿到所有push进来的子控制器,这个时候我们就可以按照我们的要求设置了.
+ 自定义控制器顶部TitleButton
	我们可以在UIViewController中嵌套ScrollView,再把TableView嵌套在ScrollView上,就会实现我们所需要的效果,这个页面其实也没什么难度,主要由很多细节需要注意一下,所以在此处,我想提醒下几点细节
	+ scrollView有默认的内边距,一定要去掉

	```
	// 默认自动设置scrollView内边距,现在禁止掉
	self.automaticallyAdjustsScrollViewInsets = NO;
	```
	+ 我们注意到顶部titleButton被选中后只是本身文字的颜色在变为红色,但是按钮本身并没有变化,这是因为,已经在ESTitleButton,重写了
	```
	- (void)setHighlighted:(BOOL)highlighted {}
	```
	但是并没有实现,直接覆盖了系统的做法


### 最后
   有很多东西大家看了代码就可以理解,我就不啰嗦了,如果有什么问题,我们可以一起交流,这个架构仅仅只是我觉得大多数APP都一样,就抽出来玩玩而已,手势的冲突等一些别的问题,有空的时候可以一起讨论.欢迎批评指正.

