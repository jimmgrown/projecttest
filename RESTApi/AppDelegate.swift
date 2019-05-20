//
//  AppDelegate.swift
//  RESTApi
//
//  Created by user152741 on 26/04/2019.
//  Copyright © 2019 user152741. All rights reserved.
//

var vkDelegateReference : SwiftyVKDelegate?

#if os(iOS)
import UIKit
import SwiftyVK

@UIApplicationMain
final class AppDelegate : UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    
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

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
        ) -> Bool {
        vkDelegateReference = VKDelegateExample()
        VK.sessions.default.logIn(
            onSuccess: { _ in
                // Start working with SwiftyVK session here
        },
            onError: { _ in
                // Handle an error if something went wrong
        }
        )
        return true
    }
    
    @available(iOS 9.0, *)
    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey: Any] = [:]
        ) -> Bool {
        let app = options[.sourceApplication] as? String
        VK.handle(url: url, sourceApplication: app)
        return true
    }
    
    func application(
        _ application: UIApplication,
        open url: URL,
        sourceApplication: String?,
        annotation: Any
        ) -> Bool {
        VK.handle(url: url, sourceApplication: sourceApplication)
        return true
    }
}
#elseif os(macOS)
import Cocoa

@NSApplicationMain
final class AppDelegate : NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        vkDelegateReference = VKDelegateExample()
    }
}
#endif



