//
//  PictureCycleViewController.h
//  S01-图片轮播()
//
//  Created by Jerry on 15/7/3.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PictureCycleViewController : UICollectionViewController

@property (nonatomic,assign,getter=isNetImage)BOOL netImage;

/// 图片数组
@property (nonatomic, strong) NSArray *cycleImageList;

// 图片url数组
@property (nonatomic,strong) NSArray *cycleImageUrls;

/// 轮播时间间隔，默认2秒
@property (nonatomic, assign) NSUInteger cycleTimeInterval;

@end
