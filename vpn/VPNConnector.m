//
//  VPNConnector.m
//  VPNTool
//
//  Created by Valentin Cherepyanko on 18/11/14.
//  Copyright (c) 2014 Valentin Cherepyanko. All rights reserved.
//

#define ACCOUNT @"aomfwyae"
#define PASSWORD @"vpn"
#define SERVER @"us1.enshi.us"
#define SECRET @"vpn"

#import "VPNConnector.h"

@implementation VPNConnector

+ (VPNConnector *)instance {
    static VPNConnector *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [VPNConnector new];
    });
    return instance;
}

- (void)loadConfig {
    NEVPNManager *manager = [NEVPNManager sharedManager];
    NSLog(@"Hi!");
    [manager loadFromPreferencesWithCompletionHandler:^(NSError *error) {
        NSLog(@"Hey!");
        if(error) {
            NSLog(@"Load error: %@", error);
        } else {
            [manager setProtocol:[self getProtocol]];
            [manager setOnDemandEnabled:NO];
            [manager setEnabled:YES];
            [manager setLocalizedDescription:@"zsh's VPN"];
            
            [manager saveToPreferencesWithCompletionHandler:^(NSError *error) {
                if(error) {
                    NSLog(@"Save error: %@", error);
                }
                else {
                    NSLog(@"Saved!");
                }
            }];
        }
    }];
}

- (NEVPNProtocolIPSec*)getProtocol {
    //    IOS 8 supports two major protocols : IPSec and IKEv2
    NEVPNProtocolIPSec *p = [[NEVPNProtocolIPSec alloc] init];
    p.username = ACCOUNT;
    p.passwordReference = [PASSWORD dataUsingEncoding:NSUTF8StringEncoding];
    p.serverAddress = SERVER;

    /*
     IOS 8 supports three authentication Methods:
     NEVPNIKEAuthenticationMethodNone: Do not authenticate with IPSec server.
     NEVPNIKEAuthenticationMethodCertificate: Use a certificate and private key as the authentication credential.
        fill identityData instead sharedSecretReference, identityData must be a NSData in PKCS12 format:
        p.identityData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"clientCert" ofType:@"p12"]];
     NEVPNIKEAuthenticationMethodSharedSecret: Use a shared secret as the authentication credential.
     */
    p.authenticationMethod = NEVPNIKEAuthenticationMethodSharedSecret;
    p.sharedSecretReference = [SECRET dataUsingEncoding:NSUTF8StringEncoding];
    p.localIdentifier = @"pgfast";
    p.remoteIdentifier = @"tvpn";
    p.useExtendedAuthentication = YES;
    p.disconnectOnSleep = NO;
    return p;
}

- (void)connect{
    NSError *startError;
    [[NEVPNManager sharedManager].connection startVPNTunnelAndReturnError:&startError];
    if (startError) {
        NSLog(@"Start error: %@",startError.localizedDescription);
    }else{
        NSLog(@"Connection established!");
    }
    
}


@end