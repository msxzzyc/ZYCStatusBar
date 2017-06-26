//
//  ZYCStatusBarHUD.m
//  ZYCStatusBarHUD
//
//  Created by wpzyc on 2017/6/26.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ZYCStatusBarHUD.h"

#define ZYCMessageFont [UIFont systemFontOfSize:12]
/**消息的停留时间*/
static CGFloat const ZYCMessageDuration = 2.0;
/**动画的显示/隐藏时间*/
static CGFloat const ZYCAnimationDuration = 0.25;
@implementation ZYCStatusBarHUD
/** 全局的窗口*/
static UIWindow *window_;
/** 定时器*/
static NSTimer *timer_;
//显示窗口
+ (void)setUpWindow
{
    //frame数据
    CGFloat windowH = 20;
    
    CGRect frame = CGRectMake(0, -windowH, [UIScreen mainScreen].bounds.size.width, windowH);
    //显示窗口
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc]init];
    window_.frame = frame;
    window_.backgroundColor = [UIColor blackColor];
    window_.windowLevel = UIWindowLevelAlert;
    window_.hidden = NO;
    
    //添加动画
    //    POPSpringAnimation *anim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
    //    CGFloat centerX = window_.center.x;
    //    CGFloat centerEndY = 10;
    //    CGFloat centerBeginY = centerEndY - 50;
    //
    //    anim.fromValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerBeginY)];
    //    anim.toValue = [NSValue valueWithCGPoint:CGPointMake(centerX, centerEndY)];
    //
    //    [window_ pop_addAnimation:anim forKey:nil];
    frame.origin.y = 0;
    [UIView animateWithDuration:ZYCAnimationDuration animations:^{
        window_.frame = frame;
    }];

    
}
/**
 *显示普通信息
 * @param msg    文字
 * @param image  图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //停止上一个定时器
    [timer_ invalidate];
//    timer_ = nil;
    //显示窗口
    [self setUpWindow];
    
    //添加按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = window_.bounds;
    [button setImage:image  forState:UIControlStateNormal];
    [button setTitle:msg forState:UIControlStateNormal];
    button.userInteractionEnabled = NO;
    button.titleLabel.font = ZYCMessageFont;
    if (image) {
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    [window_ addSubview:button];

    //定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZYCMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
    
}

/**
 *显示成功信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZYCStatusBarHUD.bundle/check"]];
}
/**
 *显示失败信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"ZYCStatusBarHUD.bundle/error"]];
}
/**
 *显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg
{
    //停止上一个定时器
    [timer_ invalidate];
    timer_ = nil;
    //显示窗口
    [self setUpWindow];

    //添加label
    UILabel *label = [[UILabel alloc]init];
    label.frame = window_.bounds;
    label.font = ZYCMessageFont;
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.text = msg;
    [window_ addSubview:label];
  
    //添加圈圈
    UIActivityIndicatorView *loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [loadingView startAnimating];
    //文字宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName:ZYCMessageFont}].width;
    
    CGFloat centerX = (window_.frame.size.width - msgW)*0.5 - 20;
    CGFloat centerY = window_.frame.size.height *0.5;
    loadingView.center = CGPointMake(centerX, centerY);
    
    [window_ addSubview:loadingView];
    
    
}
/**
 *隐藏
 */
+ (void)hide{

    //frame数据
    CGRect frame = window_.frame;
    frame.origin.y = -frame.size.height;
    [UIView animateWithDuration:ZYCAnimationDuration animations:^{
        window_.frame = frame;
    } completion:^(BOOL finished) {
        window_ = nil;
        timer_ = nil;
    }];
}

@end
