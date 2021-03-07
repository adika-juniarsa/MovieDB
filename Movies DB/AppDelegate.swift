//
//  AppDelegate.swift
//  Movies DB
//
//  Created by Alo-Adika on 06/03/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let vc = HomeScreenRouter.createModule()
        let navigation = UINavigationController(rootViewController: vc)
        navigation.setNavigationBarHidden(true, animated: true)
        self.window?.rootViewController = navigation
        self.window?.makeKeyAndVisible()
        return true
    }
}

