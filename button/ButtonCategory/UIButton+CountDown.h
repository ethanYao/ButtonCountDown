//
//  UIButton+CountDown.h
//  button
//
//  Created by Mr_Yao on 9/1/2016.
//  Copyright © 2016年 Mr_Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (CountDown)

- (void)startWithTime:(NSInteger)timeLine title:(NSString *)title countDownTitle:(NSString *)subTitle mainColor:(UIColor *)mColor countColor:(UIColor *)color;


@end
