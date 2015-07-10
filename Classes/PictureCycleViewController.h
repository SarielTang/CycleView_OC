//
//  PictureCycleViewController.h
//  S01-图片轮播()
//
//  Created by Jerry on 15/7/3.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCycleViewController : UICollectionViewController

/// 图片数组
@property (nonatomic, strong) NSMutableArray *cycleImageList;

/// 轮播时间间隔
@property (nonatomic, assign) NSUInteger cycleTimeInterval;

@end
