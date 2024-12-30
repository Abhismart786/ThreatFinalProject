//
//  Threat_AppApp.swift
//  Threat App
//
//  Created by Abhishek Sehgal on 2024-12-06.
//

import SwiftUI
import FirebaseCore
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Firebase is configured!")
    return true
  }
}
@main
struct Threat_AppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
