//
//  PictureCycleCell.m
//  S01-图片轮播()
//
//  Created by Jerry on 15/7/3.
//  Copyright (c) 2015年 Jerry. All rights reserved.
//

#import "PictureCycleCell.h"

@implementation PictureCycleCell

//由于assign需要进行地址赋为空的操作，否则会出现野指针错误，所以需要进行释放.
- (void)dealloc {
    _delegate = nil;
}

//自动布局
- (instancetype)initWithFrame:(CGRect)frame {
	
	if (self = [super initWithFrame:frame]) {
		self.imageView.contentMode = UIViewContentModeScaleToFill;
		[self addSubview: self.imageView];
		
		// 设置 imageView 的约束 VFL
		[self.imageView setTranslatesAutoresizingMaskIntoConstraints:NO];
		
		NSArray *cons1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:@{@"imageView":self.imageView}];
		
		NSArray *cons2 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]-0-|" options:NSLayoutFormatAlignAllLeft metrics:nil views:@{@"imageView" : self.imageView}];
		
		[self addConstraints:cons1];
		[self addConstraints:cons2];
	}
	return self;
}

// 当cell被点击的时候调用
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(pictureCycleCellDidSelected:)]) {
            
            [self.delegate pictureCycleCellDidSelected:self.itemTag];
        }
    }
}

#pragma mark - 属性 setter
- (void)setImage:(UIImage *)image {
	
	if (image) {
		
		_image = image;
		self.imageView.image = image;
	}
}

#pragma mark - 懒加载
- (UIImageView *)imageView {
	
	if (!_imageView) {
		
		_imageView = [[UIImageView alloc] init];
	}
	return _imageView;
}


@end











