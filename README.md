# SwitchNavigationBar

### 便捷的调用：
1.  控制器遵守```NavTheme```协议；
2.  调用```self.navTitle(title: String)``` 和```self.navTheme(style: ThemeStyle)```方法；
3. 如果ThemeStyle是custom，则可以重写方法```func customNavView() -> UIView?```自定义导航栏。

### 目前存在的问题：
- 自定义和原生的导航栏之间的push，要做比较麻烦的隐藏原生导航栏的处理。

