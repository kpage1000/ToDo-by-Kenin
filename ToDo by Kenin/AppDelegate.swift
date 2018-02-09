//
//  AppDelegate.swift
//  ToDo by Kenin
//
//  Created by Kenin Page on 2/6/18.
//  Copyright © 2018 Kenin Page. All rights reserved.
//

import UIKit
import RealmSwift


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        //print (Realm.Configuration.defaultConfiguration.fileURL)
        
        do {
            _ = try Realm()
        } catch {
            print("Error initializing Realm \(error)")
        }
        
        return true
    }

    func applicationWillTerminate(_ application: UIApplication) {

        //TODO KENIN Maybe this is where we delete checked items automatically???
        
    }

}

