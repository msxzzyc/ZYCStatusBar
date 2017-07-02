//
//  ViewController.m
//  ZYCStatusBarHUDExample
//
//  Created by wpzyc on 2017/6/26.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCStatusBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //改变了方法顺序
    
}
- (IBAction)success:(id)sender {
    [ZYCStatusBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [ZYCStatusBarHUD showError:@"加载失败"];
}
- (IBAction)message:(id)sender {
    [ZYCStatusBarHUD showMessage:@"没啥事" image:nil ];
    
}
- (IBAction)loading:(id)sender {
    [ZYCStatusBarHUD showLoading:@"正在加载..."];
}
- (IBAction)hide:(id)sender {
    [ZYCStatusBarHUD hide];
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    //    [ZYCStatuBarHUD showSuccess:@"加载成功！"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
