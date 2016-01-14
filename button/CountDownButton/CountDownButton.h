//
//  CountDownButton.h
//  button
//
//  Created by Mr_Yao on 10/1/2016.
//  Copyright © 2016年 Mr_Yao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CountDownButton : UIButton

/**
 *  count down time
 */
@property (nonatomic, assign) NSInteger timeLine;

/**
 *  title of after count down
 */
@property (nonatomic, copy) NSString *lastTitle;

/**
 *  title of before count down
 */
@property (nonatomic, copy) NSString *firstTitle;

/**
 *  before or after count down color
 */
@property (nonatomic, strong) UIColor *mColor;

/**
 *  counting down color
 */
@property (nonatomic, strong) UIColor *color;


@end
