//
//  playfulApp.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/28.
//

import SwiftUI
import AVKit
import Foundation
import UIKit

class AppDelegate: UIResponder, UIApplicationDelegate{
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        /*_ application のように_ aの間に空白がいる*/
        if(loadDrinkmarks() != nil){
            drinkArray = loadDrinkmarks()!
        }
        print(drinkArray)
        return true
    }
}

@main
struct playfulApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
