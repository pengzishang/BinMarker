//
//  AppDelegate.h
//  BinMarker
//
//  Created by 彭子上 on 2016/11/17.
//  Copyright © 2016年 彭子上. All rights reserved.
//

#import <UIKit/UIKit.h>
@class UserInfo;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property(strong, nonatomic) NSTimer *autoScan;
@property(strong, nonatomic) UserInfo *user;
@end

