//
//  ZYCStatuBarHUD.h
//  ZYCStatuBarHUD
//
//  Created by wpzyc on 2017/6/26.
//  Copyright © 2017年 wpzyc. All rights reserved.
//
// 大版本号.功能版本号.BUG修复版本号
// 0.0.0
#import <UIKit/UIKit.h>

@interface ZYCStatuBarHUD : NSObject
//显示窗口
+ (void)setUpWindow;
/**
 *显示普通信息
 * @param msg    文字
 * @param image  图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;
/** 
 *显示成功信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *显示失败信息
 */
+ (void)showError:(NSString *)msg;
/**
 *显示正在处理信息
 */
+ (void)showLoading:(NSString *)msg;
/**
 *隐藏
 */
+ (void)hide;


@end
