//
//  CountDownButton.m
//  button
//
//  Created by Mr_Yao on 10/1/2016.
//  Copyright © 2016年 Mr_Yao. All rights reserved.
//

#import "CountDownButton.h"

@interface CountDownButton ()

@property (nonatomic, strong) UILabel *countLabel;

@end

@implementation CountDownButton

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        self.layer.masksToBounds = YES;
        [self addSubview:self.countLabel];
        [self addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return self;
    
}

- (void)setMColor:(UIColor *)mColor {
    
    if (_mColor != mColor) {
        _mColor = mColor;
        self.backgroundColor = mColor;
    }
}

- (void)setFirstTitle:(NSString *)firstTitle {
    
    if (_firstTitle != firstTitle) {
        _firstTitle = firstTitle;
        self.countLabel.text = firstTitle;
    }
    
    
}

- (void)clickButton:(UIButton *)button {
    
    [self startCountDown];
    [self executeAnimation];
}

- (void)startCountDown {
    
    // count down time
    __block NSInteger timeOut = self.timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // execute every time
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
        // the end of count down, close 
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self.countLabel.layer removeAllAnimations];
                self.backgroundColor = self.mColor;
                self.countLabel.text = self.lastTitle;
                self.userInteractionEnabled = YES;
                
            });
            
        }else {
            
            int seconds = timeOut % 60;
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.backgroundColor = self.color;
                self.countLabel.text = [NSString stringWithFormat:@"%d", seconds];
                
                self.userInteractionEnabled = NO;
                
            });
            
            timeOut--;
            
        }
        
        
    });
    
    dispatch_resume(_timer);
    
    
}

// execute animation
- (void)executeAnimation {
    
    CAKeyframeAnimation *scaleAnimate = [[CAKeyframeAnimation alloc] init];
    scaleAnimate.keyPath = @"transform.scale";
    scaleAnimate.keyTimes = @[@0, @0.5, @1];
    scaleAnimate.values = @[@1, @1.5, @2];
    scaleAnimate.duration = 1;
    
    CAKeyframeAnimation *opacAnimate = [[CAKeyframeAnimation alloc] init];
    opacAnimate.keyPath = @"opacity";
    opacAnimate.keyTimes = @[@0, @0.5, @1];
    opacAnimate.values = @[@1, @0.5, @0];
    opacAnimate.duration = 1;
    
    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[scaleAnimate, opacAnimate];
    group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    group.duration = 1;
    group.repeatCount = HUGE;
    group.removedOnCompletion = NO;
    group.beginTime = CACurrentMediaTime();
    
    [self.countLabel.layer addAnimation:group forKey:@"animation"];
    [self.layer addSublayer:self.countLabel.layer];
    
}

- (UILabel *)countLabel {
    
    if (!_countLabel) {
        _countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame))];
        _countLabel.textAlignment = NSTextAlignmentCenter;
        _countLabel.font = [UIFont systemFontOfSize:17.0f];
        _countLabel.backgroundColor = [UIColor clearColor];
        
    }
    
    return _countLabel;
}

@end
