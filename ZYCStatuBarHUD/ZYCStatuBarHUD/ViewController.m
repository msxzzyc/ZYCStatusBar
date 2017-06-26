//
//  ViewController.m
//  ZYCStatuBarHUD
//
//  Created by wpzyc on 2017/6/26.
//  Copyright © 2017年 wpzyc. All rights reserved.
//

#import "ViewController.h"
#import "ZYCStatuBarHUD.h"
@interface ViewController ()

@end

@implementation ViewController
- (IBAction)success:(id)sender {
    [ZYCStatuBarHUD showSuccess:@"加载成功"];
}
- (IBAction)error:(id)sender {
    [ZYCStatuBarHUD showError:@"加载失败"];
}
- (IBAction)message:(id)sender {
    [ZYCStatuBarHUD showMessage:@"没啥事" image:[UIImage imageNamed:@"check"]];
    
}
- (IBAction)loading:(id)sender {
    [ZYCStatuBarHUD showLoading:@"正在加载..."];
}
- (IBAction)hide:(id)sender {
    [ZYCStatuBarHUD hide];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
//    [ZYCStatuBarHUD showSuccess:@"加载成功！"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
