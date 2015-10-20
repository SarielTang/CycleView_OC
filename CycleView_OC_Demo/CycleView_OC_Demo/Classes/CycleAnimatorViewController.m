//
//  CycleAnimatorViewController.m
//  CycleView_OC
//
//  Created by SarielTang on 15/10/17.
//  Copyright © 2015年 SarielTang. All rights reserved.
//

#import "CycleAnimatorViewController.h"
#import "NSTimer+SRTimer.h"

static const NSArray *___SRTransitionAnimateType;

// 创建初始化函数。等于用宏创建一个getter函数

#define SRTransitionAnimateTypeGet (___SRTransitionAnimateType == nil ? ___SRTransitionAnimateType = [[NSArray alloc] initWithObjects:\
@"fade",\
@"movein",\
@"push",\
@"reveal",\
@"cube",\
@"oglFlip",\
@"suckEffect",\
@"rippleEffect",\
@"pageCurl",\
@"pageUnCurl",\
@"cameralIrisHollowOpen",\
@"cameraIrisHollowClose",nil] : ___SRTransitionAnimateType)

// 枚举 to 字符串

#define SRTransitionAnimateTypeString(type) ([SRTransitionAnimateTypeGet objectAtIndex:type])

// 字符串 to 枚举

#define SRTransitionAnimateTypeEnum(string) ([SRTransitionAnimateTypeGet indexOfObject:string])

@interface CycleAnimatorViewController ()

@property (nonatomic,assign)int currentIndex;
@property (nonatomic,strong)NSTimer *animatorTimer;
// pageController
@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation CycleAnimatorViewController

- (void)loadView {
    
    self.view = [[UIView alloc]initWithFrame:[UIScreen mainScreen].bounds];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[imageView]-0-|" options:0 metrics:nil views:@{@"imageView": self.animatorImageView}]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[imageView]-0-|" options:0 metrics:nil views:@{@"imageView": self.animatorImageView}]];
    
    //创建pageControl
    _pageControl = [[UIPageControl alloc] init];
    [self.view addSubview:self.pageControl];
    
    //设置初始化时间间隔
    _cycleTimeInterval = 4;
    _animationType = SRTransitionAnimateTypeCube;
    _isLimitGestureWhenAnimating = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    UISwipeGestureRecognizer *leftSwiperGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipe:)];
    leftSwiperGesture.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:leftSwiperGesture];
//    leftSwiperGesture.delegate = self;
    
    UISwipeGestureRecognizer *rightSwiperGesture = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipe:)];
    rightSwiperGesture.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:rightSwiperGesture];
//    rightSwiperGesture.delegate = self;
    
    [self timeStart];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSAssert(_animatorImageList,@"缺少animatorImageList");
    
    [self.animatorTimer resumeTimerAfterTimeInterval:self.cycleTimeInterval];
    
    self.pageControl.numberOfPages = self.animatorImageList.count;
    self.pageControl.center = CGPointMake(self.view.frame.size.width * 0.5, self.view.frame.size.height * 0.9);
    [self.view bringSubviewToFront:self.pageControl];
    
    [self.animatorImageView setImage:self.animatorImageList[self.currentIndex]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.animatorTimer pauseTimer];
}

//- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
//    [self.animatorTimer pauseTimer];
//    return YES;
//}

//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.animatorTimer pauseTimer];
//}

//- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    [self.animatorTimer resumeTimerAfterTimeInterval:(self.cycleTimeInterval * 0.5)];
//}

//- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
//    if ([touch.view isKindOfClass:[UIImageView class]]) {
//        return NO;
//    }
//    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
//    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
//        return NO;
//    }
//    return YES;
//}

- (void)leftSwipe:(UISwipeGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self.animatorTimer pauseTimer];
    }
    [self transitionAnimation:YES];
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.animatorTimer resumeTimerAfterTimeInterval:(self.cycleTimeInterval)];
    }
}

- (void)rightSwipe:(UISwipeGestureRecognizer *)gesture {
    if (gesture.state == UIGestureRecognizerStateBegan) {
        [self.animatorTimer pauseTimer];
    }
    [self transitionAnimation:NO];
    if (gesture.state == UIGestureRecognizerStateEnded) {
        [self.animatorTimer resumeTimerAfterTimeInterval:(self.cycleTimeInterval)];
    }
}

- (void)timeStart {
    // 1. 创建定时器
    self.animatorTimer = [NSTimer timerWithTimeInterval:self.cycleTimeInterval target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    // 2. 添加定时器
    [[NSRunLoop currentRunLoop] addTimer:self.animatorTimer forMode:NSRunLoopCommonModes];
}

- (void)nextImage {
    [self transitionAnimation:YES];
}

static bool isAnimating;
//转场动画
- (void)transitionAnimation:(BOOL)isNext {
    if (!isAnimating) {
//        NSLog(@"isAnimating----%d",isAnimating);
        CATransition *transition = [[CATransition alloc]init];
        transition.type = SRTransitionAnimateTypeString(_animationType);
        
        if (self.isLimitGestureWhenAnimating) {
            transition.delegate = self;
        }
        
        //设置子类型
        if (isNext) {
            transition.subtype=kCATransitionFromRight;
        }else{
            transition.subtype=kCATransitionFromLeft;
        }
        //设置动画时常
        transition.duration=1.0;
        
        //3.设置转场后的新视图添加转场动画
        [self.animatorImageView setImage:[self getImage:isNext]];
        [self.animatorImageView.layer addAnimation:transition forKey:@"SRTransitionAnimation"];
        
    }
}

- (void)animationDidStart:(CAAnimation *)anim {
    isAnimating = YES;
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    isAnimating = NO;
}

//取得当前图片
- (UIImage *)getImage:(BOOL)isNext {
    if (isNext) {
        self.currentIndex = (self.currentIndex+1)%self.animatorImageList.count;
    }else{
        self.currentIndex = (self.currentIndex-1+self.animatorImageList.count)%((int)self.animatorImageList.count);
    }
    self.pageControl.currentPage = self.currentIndex;
    return self.animatorImageList[self.currentIndex];
}

- (UIImageView *)animatorImageView {
    if (_animatorImageView == nil) {
        _animatorImageView = [[UIImageView alloc]initWithFrame:self.view.bounds];
        [self.view addSubview:self.animatorImageView];
        _animatorImageView.userInteractionEnabled = YES;
        UIGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(imageViewDidClicked)];
        [_animatorImageView addGestureRecognizer:singleTap];
//        [_animatorImageView addTarget:self action:@selector(imageViewDidClicked) forControlEvents:UIControlEventTouchUpInside];
    }
    return _animatorImageView;
}

- (void)imageViewDidClicked {
//    NSLog(@"---------imageViewDidClicked");
    if (self.delegate) {
        if ([self.delegate respondsToSelector:@selector(pictureCycleCellDidSelected:)]) {
            [self.delegate pictureCycleCellDidSelected:self.currentIndex];
        }
    }
}

- (NSArray *)animatorImageList {
    if (_animatorImageList == nil) {
        _animatorImageList = [NSArray array];
    }
    return _animatorImageList;
}
@end
