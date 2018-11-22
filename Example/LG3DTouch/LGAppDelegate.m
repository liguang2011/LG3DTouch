//
//  LGAppDelegate.m
//  LG3DTouch
//
//  Created by 553521355@qq.com on 11/22/2018.
//  Copyright (c) 2018 553521355@qq.com. All rights reserved.
//

#import "LGAppDelegate.h"

@implementation LGAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    LGShortcutItem *item1 = [[LGShortcutItem alloc] initWithIconType:UIApplicationShortcutIconTypeHome typeName:@"GoType1" localizedTitle:@"去目的地1" localizedSubtitle:nil jumpUrl:@"action://page=home"];
    
    LGShortcutItem *item2 = [[LGShortcutItem alloc] initWithIconType:UIApplicationShortcutIconTypeTask typeName:@"GoType2" localizedTitle:@"去目的地2" localizedSubtitle:@"子标题2" jumpUrl:nil];
    
    [[LG3DTouchManager shareManager] autoRegisterUnit:item1];
    [[LG3DTouchManager shareManager] autoRegisterUnit:item2];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    //一系列操作 配合跳转中心使用
}

@end
