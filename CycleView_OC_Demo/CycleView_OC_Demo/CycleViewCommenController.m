//
//  CycleViewCommenController.m
//  CycleView_OC_Demo
//
//  Created by SarielTang on 15/12/7.
//  Copyright © 2015年 SarielTang. All rights reserved.
//

#import "CycleViewCommenController.h"

@interface CycleViewCommenController ()<PictureCycleCellDelegate>

@end

@implementation CycleViewCommenController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSMutableArray *arrayM = [NSMutableArray array];
//    
//    for (int i = 0; i < 5; ++i) {
//        
//        NSString *imageName = [NSString stringWithFormat:@"%02d.jpg", i + 1];
//        [arrayM addObject:[UIImage imageNamed:imageName]];
//    }
    
#pragma mark - required
    //You should set the size of the view
    //设置视图的大小
    [self.view setFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
    
    //You should set the image array
    //设置图片数组
//    self.cycleImageList = arrayM;
    //设置网络图片
    self.netImage = YES;
}

- (void)pictureCycleCellDidSelected:(NSInteger)itemTag {
    NSLog(@"点击了图片%ld",itemTag);
}

@end
