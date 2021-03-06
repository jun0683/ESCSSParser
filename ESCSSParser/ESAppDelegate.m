//
//  ESAppDelegate.m
//  ESCSSParser
//
//  Created by Tracy E on 12-11-12.
//  Copyright (c) 2012年 Tracy E. All rights reserved.
//

#import "ESAppDelegate.h"
#import "ESCSSParser.h"
#import "KakaoCSSProperty.h"

@implementation ESAppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"KakaoTalk" ofType:@"css"];
    NSString *cssText = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
    
    NSDictionary *styleSheet = [ESCSSParser parse:cssText];
    
    for (id key1 in styleSheet)
    {
        NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
        for (id key2 in [styleSheet objectForKey:key1])
        {
            [dic setValue:[KakaoCSSProperty parseValue:key2 property:[[styleSheet objectForKey:key1] objectForKey:key2]] forKey:key2];
            
        }
        
        NSLog(@"%@",dic);
        NSLog(@"%@",[styleSheet objectForKey:key1]);
    }
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
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

@end
