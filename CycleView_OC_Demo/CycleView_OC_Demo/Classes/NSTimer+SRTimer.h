//
//  NSTimer+SRTimer.h
//  CycleView_OC
//
//  Created by SarielTang on 15/10/17.
//  Copyright © 2015年 SarielTang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (SRTimer)

- (void)startTimer;
- (void)pauseTimer;
- (void)resumeTimer;
- (void)resumeTimerAfterTimeInterval:(NSTimeInterval)interval;

@end
