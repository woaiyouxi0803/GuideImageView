//
//  AppDelegate.m
//  GuideImageViewExample
//
//  Created by jiangxin on 2018/7/18.
//  Copyright © 2018年 woaiyouxi0803. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UITabBarController * tabBarController = [[UITabBarController alloc] init];
    [tabBarController addChildViewController:[self addChildViewControllerClassName:@"FirstViewController" title:@"首页" image:@"ic_grayhome" selectImage:@"ic_redhome"]];
    [tabBarController addChildViewController:[self addChildViewControllerClassName:@"ViewController" title:@"出招" image:@"ic_graycourse" selectImage:@"ic_redcourse"]];
    
    self.window.rootViewController = tabBarController;
    
    return YES;
}

- (UIViewController *)addChildViewControllerClassName:(NSString *)className title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    UIViewController *vc = [[NSClassFromString(className) alloc] init];
    UINavigationController *nvc = [[UINavigationController alloc] initWithRootViewController:vc];
    
    NSDictionary *normalItem = [NSDictionary dictionaryWithObjectsAndKeys:
                                [UIFont systemFontOfSize:10],NSFontAttributeName,
                                [UIColor grayColor], NSForegroundColorAttributeName, nil];
    NSDictionary *hightlightItem = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIFont boldSystemFontOfSize:10],NSFontAttributeName,
                                    [UIColor redColor], NSForegroundColorAttributeName, nil];
    nvc.tabBarItem.title = title;
    nvc.tabBarItem.image = [UIImage imageNamed:image];
    nvc.tabBarItem.selectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [nvc.tabBarItem setTitleTextAttributes:normalItem forState:UIControlStateNormal];
    [nvc.tabBarItem setTitleTextAttributes:hightlightItem forState:UIControlStateSelected];
    
    return nvc;
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
