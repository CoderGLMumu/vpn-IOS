//
//  VPNConnector.h
//  VPNTool
//
//  Created by Valentin Cherepyanko on 18/11/14.
//  Copyright (c) 2014 Valentin Cherepyanko. All rights reserved.
//



#import <Foundation/Foundation.h>
#import <NetworkExtension/NetworkExtension.h>

@interface VPNConnector : NSObject

+ (VPNConnector *)instance;
- (void)loadConfig;
- (void)connect;

@end
