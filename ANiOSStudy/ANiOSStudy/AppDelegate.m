//
//  AppDelegate.m
//  ANiOSStudyhttp://photo.blog.sina.com.cn/showpic.html#blogid=5fede45a0102v41k&url=http://album.sina.com.cn/pic/001KUZe2gy6NgT69Rbk4a
//
//  Created by Anson on 2017/1/7.
//  Copyright © 2017年 An. All rights reserved.
//

#import "AppDelegate.h"
#import "ANHomeVC.h"
#import "ANFirstPage.h"
#import "ViewController.h"
#import "secondPage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
//    ANHomeVC *vcHome = [[ANHomeVC alloc] init];
//    UINavigationController *nvgtVCHome = [[UINavigationController alloc] initWithRootViewController:vcHome];
    
    ANFirstPage *vcHome = [[ANFirstPage alloc] init];
    UINavigationController *nvgtVCHome = [[UINavigationController alloc] initWithRootViewController:vcHome];

    
    UITabBarController *tabBarVC = [[UITabBarController alloc] init];
    tabBarVC.viewControllers = @[nvgtVCHome];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = tabBarVC;
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
//    NSLog(@"123");
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
