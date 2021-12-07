//
//  RCValues.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation
import Firebase

class RCValues {
  static let sharedInstance = RCValues()
  var loginTextFromFirebase: String?
  var updateLoginText:()->()={}
    
  private init() {
   // loadDefaultValues()
    activateDebugMode()
    fetchCloudValues()
  }

//  func loadDefaultValues() {
//    let appDefaults: [String: Any?] = [
//      "appPrimaryColor": "#FBB03B"
//    ]
//    RemoteConfig.remoteConfig().setDefaults(appDefaults as? [String: NSObject])
//  }
    
    func activateDebugMode() {
      let settings = RemoteConfigSettings()
      // WARNING: Don't actually do this in production!
      settings.minimumFetchInterval = 0
      RemoteConfig.remoteConfig().configSettings = settings
    }
    
    func fetchCloudValues() {
      // 1
      activateDebugMode()

      // 2
      RemoteConfig.remoteConfig().fetch { [weak self] _, error in
        if let error = error {
          print("Uh-oh. Got an error fetching remote values \(error)")
          // In a real app, you would probably want to call the loading
          // done callback anyway, and just proceed with the default values.
          // I won't do that here, so we can call attention
          // to the fact that Remote Config isn't loading.
            
          return
        }
          self?.loginTextFromFirebase = RemoteConfig.remoteConfig().configValue(forKey: "login").stringValue ?? ""
          self?.updateLoginText()

        // 3
        RemoteConfig.remoteConfig().activate { _, _ in
          print("Retrieved values from the cloud!")

        }
          
      }
    }
}
