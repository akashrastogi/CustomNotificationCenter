//
//  AppDelegate.swift
//  CustomNotificationCenter
//
//  Created by Akash Rastogi on 10/8/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    CustomNotificationCenter.shared.addObserver(self, name: "viewDidLoadNotification") { name, object in
      print("Custom notification received with name- \(name), value- \(object)")
    }
    return true
  }
}
