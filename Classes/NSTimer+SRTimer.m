//
//  NSTimer+SRTimer.m
//  CycleView_OC
//
//  Created by SarielTang on 15/10/17.
//  Copyright © 2015年 SarielTang. All rights reserved.
//

#import "NSTimer+SRTimer.h"

@implementation NSTimer (SRTimer)

- (void)startTimer {
    if ([self isValid]) {
        return;
    }
    
//    [self setFireDate:[NSDate distantPast]];//开启
    [self fire];
}

- (void)pauseTimer{
    if (![self isValid]) {
        return ;
    }
    
    [self setFireDate:[NSDate distantFuture]]; //如果给我一个期限，我希望是4001-01-01 00:00:00 +0000
}


- (void)resumeTimer{
    if (![self isValid]) {
        return ;
    }
    
    [self setFireDate:[NSDate date]];
}

- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval
{
    if (![self isValid]) {
        return ;
    }
    [self setFireDate:[NSDate dateWithTimeIntervalSinceNow:interval]];
}

@end
