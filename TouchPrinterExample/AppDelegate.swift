//
//  AppDelegate.swift
//  TouchPrinter
//
//  Created by Nguyen, Cong on 2020/12/25.
//

import UIKit
import TouchPrinter

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow()
    window.rootViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
    window.makeKeyAndVisible()
    self.window = window

    TouchPrinter.start()

    return true
  }
}

