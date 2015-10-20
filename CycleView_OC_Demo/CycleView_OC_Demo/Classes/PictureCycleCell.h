//
//  PictureCycleCell.h
//  S01-图片轮播()
//
//  Created by Jerry on 15/7/3.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol PictureCycleCellDelegate <NSObject>

/// cell 被点击
- (void)pictureCycleCellDidSelected:(NSInteger)itemTag;

@end


@interface PictureCycleCell : UICollectionViewCell

/// 图片
@property (nonatomic, strong) UIImageView *imageView;

/// image
@property (nonatomic, strong) UIImage *image;

/// tag
@property (nonatomic, assign) NSInteger itemTag;

/// delegate
@property (nonatomic, assign) id<PictureCycleCellDelegate> delegate;

@end
