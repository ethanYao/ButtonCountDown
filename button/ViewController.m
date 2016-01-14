//
//  ViewController.m
//  button
//
//  Created by Mr_Yao on 9/1/2016.
//  Copyright © 2016年 Mr_Yao. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+CountDown.h"
#import "CountDownButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    /********************************************************************
     *          please open this one that you want                       *
     *                                                                  *
     ********************************************************************/
    
    
#pragma mark - here is the normal count down (it just use the category UIButton+CountDown.h)
//    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
//    button.backgroundColor = [UIColor clearColor];
////    button.layer.borderColor = [UIColor blueColor].CGColor;
////    button.layer.borderWidth = 1;
//    button.layer.cornerRadius = 10;
//    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];
//    [button setTitle:@"获取验证码" forState:UIControlStateNormal];
//    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
//    [self.view addSubview:button];
  
#pragma this can count down with animation, it needs you creat a instance
//    CountDownButton *button = [[CountDownButton alloc] initWithFrame:CGRectMake(100, 200, 200, 100)];
//    button.lastTitle = @"重新发送验证码";
//    button.firstTitle = @"发送验证码";
//    button.timeLine = 10;
//    button.mColor = [UIColor blueColor];
//    button.color = [UIColor grayColor];
//    [self.view addSubview:button];
    
    
}

- (void)clickButton:(UIButton *)button {
    
    
    [button startWithTime:10 title:@"获取验证码" countDownTitle:@"s" mainColor:[UIColor clearColor] countColor:[UIColor grayColor]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
