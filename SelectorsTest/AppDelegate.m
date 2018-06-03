//
//  AppDelegate.m
//  SelectorsTest
//
//  Created by Admin on 01.06.18.
//  Copyright © 2018 Sergio Lechini. All rights reserved.
//

#import "AppDelegate.h"
#import "AnyObject.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor lightGrayColor];
    self.window.rootViewController = [[UIViewController alloc] init];
    [self.window makeKeyAndVisible];
    
//    AnyObject* myObj = [[AnyObject alloc] init];
//
//    [self performSelector:@selector(testMethod)];
//    [myObj performSelector:@selector(testMethod)];
//    NSLog(@"secret = %@",[myObj performSelector:@selector(superSecretMethod)]);
//    [self performSelector:@selector(testMethod:) withObject:@"OLOLO"];
//    [self performSelector:@selector(testMethod:parametr2:) withObject:@"OLOLO" afterDelay:5.f];

//    NSString* string = [self testMethodParameter1:2 parameter2:3.1 parameter3:5.5f];
//
//    NSLog(@"string = %@", string);
    
    SEL selector = @selector(testMethodParameter1:parameter2:parameter3:);
    
    NSMethodSignature* signature = [AppDelegate instanceMethodSignatureForSelector:selector];
    NSInvocation* invocation = [NSInvocation invocationWithMethodSignature:signature];
    
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    NSInteger iVal = 2;
    CGFloat fVal = 3.1f;
    double dVal = 5.5f;
    
    NSInteger * p1 = &iVal;
    CGFloat * p2 = &fVal;
    double * p3 = &dVal;
    
    [invocation setArgument:p1 atIndex:2];
    [invocation setArgument:p2 atIndex:3];
    [invocation setArgument:p3 atIndex:4];
    
    [invocation invoke];
    
    __unsafe_unretained NSString* string = nil;
    [invocation getReturnValue:&string];
    
    NSLog(@"string = %@", string);
    
    return YES;
}

- (void) testMethod {
    NSLog(@"testMethod");
}

- (void) testMethod:(NSString*) string {
    NSLog(@"testMethod: %@", string);
}

- (void) testMethod:(NSString*) string1 parametr2:(NSString*) string2 {
    NSLog(@"testMethod: %@, %@", string1, string2);
}

- (NSString*) testMethodParameter1:(NSInteger) intValue parameter2:(CGFloat) floatValue parameter3:(double) doubleValue {

    return [NSString stringWithFormat:@"testMethodParameter1: %d parameter2: %f parameter3: %f", intValue, floatValue, doubleValue];

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
