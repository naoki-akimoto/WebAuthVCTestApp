//
//  AppDelegate.swift
//  WebAuthVCTestApp
//
//  Created on 2017/08/30.
//
//

import UIKit
import KiiSDK

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        /*
        Kii.begin(withID: "52204681",
                  andKey: "6eb744eab40de1bc25689e6f11be27c4",
                  andCustomURL: "https://api-development-jp.internal.kii.com/api")
         */
        Kii.begin(withID: "94be5059",
                  andKey: "57b1a80340beec1bdcbdc83e43f76f7f",
                  andCustomURL: "https://api-development-jp.internal.kii.com/api")
        /*
        Kii.begin(withID: "1jeux2s0szog",
                  andKey: "a130c8f4b9d445cfa2f43583260248b4",
                  andSite: .JP)
 */

        Kii.setAccessTokenExpiration(1800)
        Kii.setLogLevel(3)
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

