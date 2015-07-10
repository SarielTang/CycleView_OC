//
//  CycleViewController.m
//  CycleView_OC_Demo
//
//  Created by SarielTang on 15/7/10.
//  Copyright (c) 2015年 SarielTang. All rights reserved.
//

#import "CycleViewController.h"

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
    
    self.cycleImageList = arrayM;
    NSLog(@"%@", arrayM);
}

///通过重写这个代理方法，即可进行点击图片后的交互处理.
- (void)pictureCycleCellDidSelected:(NSInteger)itemTag{
	NSLog(@"被选中的item的tag值：%zd", itemTag);
}

@end
