//
//  UIButton+CountDown.m
//  button
//
//  Created by Mr_Yao on 9/1/2016.
//  Copyright © 2016年 Mr_Yao. All rights reserved.
//

#import "UIButton+CountDown.h"

@implementation UIButton (CountDown)

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color {
    
    // count down time
    __block NSInteger timeOut = timeLine;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    
    // execute every sec
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), 1.0 * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        
       // end of count down, close
        if (timeOut <= 0) {
            dispatch_source_cancel(_timer);
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.backgroundColor = mColor;
                [self setTitle:title forState:UIControlStateNormal];
                self.userInteractionEnabled = YES;
                
            });
        
        }else {
            
            int seconds = timeOut % 60;
            NSString *timeStr = [NSString stringWithFormat:@"%0.2d", seconds];
            dispatch_async(dispatch_get_main_queue(), ^{
                
                self.backgroundColor = color;
                [self setTitle:[NSString stringWithFormat:@"%@%@", timeStr, subTitle] forState:UIControlStateNormal];
                self.userInteractionEnabled = NO;
                
            });
            
            timeOut--;
            
        }
        
        
    });
    
    dispatch_resume(_timer);
    
    
}

@end
