###MMTransitionLayer

------

>  模仿唱吧app背景渐变动画	(效果如下：)

<img src="https://ws3.sinaimg.cn/large/006tKfTcgy1fqoo8uwllig30hq0wsh6z.gif" width="200px" />

#### 使用方法

> 在Appdelegate中方法didFinishLaunchingWithOptions下添加如下代码，即可实现背景渐变色

- swift

  ```
  MM_Animations().setupLayer(layer: (self.window?.layer)!)
  ```

- Object_C

  ```
  MM_Animations *animation = [[MM_Animations alloc]init];
  [animation setupLayer:self.window.layer];
  ```

---

#####如果你很喜欢这个Demo，请留下你的小星星!!!    联系QQ:517769958