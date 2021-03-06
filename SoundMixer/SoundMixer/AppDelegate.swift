//
//  AppDelegate.swift
//  SoundMixer
//
//  Created by 利穂 虹希 on 2018/02/13.
//  Copyright © 2018年 EdTechTokushima. All rights reserved.
//

import UIKit
import MediaPlayer
let userDefaults = UserDefaults.standard

@UIApplicationMain class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  /*
   var UserName: String?
   var userID: Int?
   var playingSong:MPMediaItem?
   */
  var Playlists:MPMediaItemCollection?
  //var title:String?
  var user = User()
  var init_users: [User] = []
  var userNum: Int = 0
  private var nc: UINavigationController?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    // Override point for customization after application launch.
    setNabivigationBar()
    
    var user = User()
    if userDefaults.object(forKey: "userNumber") != nil {
      userNum = userDefaults.integer(forKey: "userNumber")
      for i in 0..<userNum {
        var dic = userDefaults.dictionary(forKey: String(i))
        init_users.append(User())
        user.Id = dic!["ID"] as! Int
        user.Name = dic!["Name"] as! String
        user.musicSetting = dic!["Setting"] as! [MusicSetting]
        init_users[i].Id = user.Id
        init_users[i].Name = user.Name
        init_users[i].musicSetting = user.musicSetting
      }
    }
    return true
  }
  
  func setNabivigationBar()
  {
    //デバッグの時ここで始めたいビューを指定できる
    let FirstViewController = UserViewController()
    nc = UINavigationController(rootViewController: FirstViewController)
    self.window = UIWindow(frame: UIScreen.main.bounds)
    self.window?.rootViewController = nc
    
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

