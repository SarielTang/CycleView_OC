# CycleView_OC

* The easiest way to use infinite-loop-view
* 用法最简单的无限循环的图片轮播器,使用OC实现，更加便于大家的使用。

## Requirements

* iOS 6.0+ 

## Installation

### CocoaPods

CocoaPods 0.36 adds supports for Swift and embedded frameworks. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate CycleView_OC into your Xcode project using CocoaPods, specify it in your `Podfile`:

```
platform :ios, '5.0'
use_frameworks!

pod 'CycleView_OC'
```

Then, run the following command:

```bash
$ pod install
```

You should open the `{Project}.xcworkspace` instead of the `{Project}.xcodeproj` after you installed anything from CocoaPods.

For more information about how to use CocoaPods, I suggest [this tutorial](http://www.raywenderlich.com/64546/introduction-to-cocoapods-2).

## 如何使用CycleView_OC
* cocoapods导入：`pod 'CycleView_OC'`
* 手动导入：
    * 将`CycleView_OC/Classes`文件夹中的所有文件拽入项目中
    * 导入主头文件：`#import "CycleView_OC.h"`

## Usage
### Regular
```
//Regular CycleView
//普通的图片轮播器
#import "CycleViewController.h"
//此处的协议用于监听图片被点击的事件。
@interface CycleViewController ()<PictureCycleCellDelegate>

@end

@implementation CycleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 5; ++i) {
        
        NSString *imageName = [NSString stringWithFormat:@"%02d.jpg", i + 1];
        [arrayM addObject:[UIImage imageNamed:imageName]];
    }
    //传入图片列表
    self.cycleImageList = arrayM;
}

///通过重写这个代理方法，即可进行点击图片后的交互处理.
//itemTag为图片的tag值，默认从0开始递增。
- (void)pictureCycleCellDidSelected:(NSInteger)itemTag{
	NSLog(@"被选中的item的tag值：%zd", itemTag);
}

```

### Special
```
//继承 CycleAnimatorViewController
@interface CycleViewController : CycleAnimatorViewController

//ViewDidLoad中的处理
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 5; ++i) {
        
        NSString *imageName = [NSString stringWithFormat:@"%02d.jpg", i + 1];
        [arrayM addObject:[UIImage imageNamed:imageName]];
    }
    
#pragma mark - required
    //You should set the size of the view
    //设置视图的大小
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    //You should set the image array
    //设置图片数组
    self.animatorImageList = arrayM;
    
#pragma mark - optional
    //you can modify the animation effect by enumeration type
    //可以通过枚举类型,修改动画效果
    self.animationType = SRTransitionAnimateTypeRippleEffect;
    
    //You can set the picture carousel time interval
    //可以设置图片轮播的时间间隔
    self.cycleTimeInterval = 4;
    
    //You can set whether to limit the page switching in the animation implementation process
    //可以设置是否限制在动画执行过程中进行页面切换
    self.isLimitGestureWhenAnimating = NO;
    
    //you can change image's contentMode
    //可以设置图片填充模式
    self.animatorImageView.contentMode = UIViewContentModeScaleToFill;
}

在需要使用这个控制器的地方进行如下设置：
    CycleViewController *cycleView = [[CycleViewController alloc] init];  // 创建图片轮转
    [self addChildViewController:cycleView];// 添加控制
    cycleView.delegate = self;//设置代理
    
    满足代理协议<CycleAnimatorViewControllerDelegate>
    通过重写这个代理方法，即可进行点击图片后的交互处理.
    - (void)pictureCycleCellDidSelected:(NSInteger)itemTag{
	    NSLog(@"被选中的item的tag值：%zd", itemTag);
    }

```
