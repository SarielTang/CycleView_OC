//
//  CycleAnimatorViewController.h
//  CycleView_OC
//
//  Created by SarielTang on 15/10/17.
//  Copyright © 2015年 SarielTang. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 动画类型	说明	对应常量	是否支持方向设置
 公开API
 fade	淡出效果	kCATransitionFade	是
 movein	新视图移动到旧视图上	kCATransitionMoveIn	是
 push	新视图推出旧视图	kCATransitionPush	是
 reveal	移开旧视图显示新视图	kCATransitionReveal	是
 私有API	 	私有API只能通过字符串访问
 cube	立方体翻转效果	无	是
 oglFlip	翻转效果	无	是
 suckEffect	收缩效果	无	否
 rippleEffect	水滴波纹效果	无	否
 pageCurl	向上翻页效果	无	是
 pageUnCurl	向下翻页效果	无	是
 cameralIrisHollowOpen	摄像头打开效果	无	否
 cameraIrisHollowClose	摄像头关闭效果	无	否
 另外对于支持方向设置的动画类型还包含子类型：
 动画子类型	说明
 kCATransitionFromRight	从右侧转场
 kCATransitionFromLeft	从左侧转场
 kCATransitionFromTop	从顶部转场
 kCATransitionFromBottom	从底部转场
 */

typedef NS_ENUM(NSInteger, SRTransitionAnimateType) {
    SRTransitionAnimateTypeFade = 0,
    SRTransitionAnimateTypeMoveIn,
    SRTransitionAnimateTypePush,
    SRTransitionAnimateTypeReveal,
    SRTransitionAnimateTypeCube,
    SRTransitionAnimateTypeOglFlip,
    SRTransitionAnimateTypeSuckEffect,
    SRTransitionAnimateTypeRippleEffect,
    SRTransitionAnimateTypePageCurl,
    SRTransitionAnimateTypePageUncurl,
    SRTransitionAnimateTypeCameraIrisHollowOpen,
    SRTransitionAnimateTypeCameraIrisHollowClose
};

#pragma mark - CycleAnimatorViewControllerDelegate代理 -

@protocol CycleAnimatorViewControllerDelegate <NSObject>

/// cell 被点击
- (void)pictureCycleCellDidSelected:(NSInteger)itemTag;

@end


#pragma mark - CycleAnimatorViewController -

@interface CycleAnimatorViewController : UIViewController

//图片视图
@property (nonatomic,strong)UIImageView *animatorImageView;

//展示的图片数组
@property (nonatomic,strong)NSArray *animatorImageList;

//动画效果类型
@property (nonatomic,assign)SRTransitionAnimateType animationType;

// 轮播时间间隔，默认4秒
@property (nonatomic, assign) NSUInteger cycleTimeInterval;

// delegate
@property (nonatomic, assign) id<CycleAnimatorViewControllerDelegate> delegate;

//是否限制动画播放过程中，无法进行页面切换，默认为false
@property (nonatomic, assign) BOOL isLimitGestureWhenAnimating;

@end
