//
//  AppDelegate.swift
//  Meibo
//
//  Created by Zhouboli on 15/8/21.
//  Copyright (c) 2015年 Boris. All rights reserved.
//

import UIKit
import Accounts

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    var
        user: User?,
        uid: NSString?,
        weiboAccount: ACAccount?,
        currentIndex: NSInteger?,
        toMeIncrement: NSInteger?,
        atMeIncrement: NSInteger?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.weiboAccount = Utils.systemAccounts().firstObject as? ACAccount
        
        self.window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        // Saves changes in the application's managed object context before the application terminates.
    }
    
    // MARK: Helpers
    
    //每次启动app检查是否通过用户的系统级授权以及账号uid
    func accessWeiboSystemAccount()
    {
        //获取系统账号数据库中的新浪微博账号数据
        self.uid = NSUserDefaults.standardUserDefaults().stringForKey("uid")
        
        //若未授权则向用户申请授权
        if self.weiboAccount == nil || self.weiboAccount?.accountType.accessGranted == false
        {
            let store = ACAccountStore()
            let type = store.accountTypeWithAccountTypeIdentifier(ACAccountTypeIdentifierSinaWeibo)
            store.requestAccessToAccountsWithType(type, options: nil, completion: { (Bool, NSError) -> Void in
                //授权成功
                if Bool == true
                {
                    NSLog("授权成功")
                    
                    //本地尚未保存授权账号uid
                    if self.uid == nil || self.uid?.length < 1
                    {
                        
                    }
                }
            })
        }
    }
    
    func setupTabBarControllers()
    {
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        //Tab 1: 微博主页
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

