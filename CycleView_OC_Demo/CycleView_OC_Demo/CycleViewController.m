//
//  CycleViewController.m
//  CycleView_OC_Demo
//
//  Created by SarielTang on 15/7/10.
//  Copyright (c) 2015年 SarielTang. All rights reserved.
//

#import "CycleViewController.h"

@interface CycleViewController ()

@end

@implementation CycleViewController

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

@end
