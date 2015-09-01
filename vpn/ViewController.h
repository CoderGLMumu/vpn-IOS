//
//  ViewController.h
//  vpn
//
//  Created by zsh on 15/8/11.
//  Copyright (c) 2015年 zsh. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VPNConnector.h"

VPNConnector *vpn;
@interface ViewController : UIViewController
- (IBAction)ConnectButtonPress:(id)sender;

@end

