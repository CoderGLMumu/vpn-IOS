//
//  ViewController.m
//  vpn
//
//  Created by zsh on 15/8/11.
//  Copyright (c) 2015年 zsh. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    [[VPNConnector instance] loadConfig];
//    vpn = [[VPNConnector alloc]init];
//    [vpn loadConfig];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)ConnectButtonPress:(id)sender {
//    VPNConnector *connector = [VPNConnector instance];
//    [connector connect];
    NSLog(@"button press");

    //    [vpn connect];
}
@end
