//
//  Connectivity.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation
import Alamofire

struct Connectivity {
  static let sharedInstance = NetworkReachabilityManager()!
  static var isConnectedToInternet:Bool {
      return self.sharedInstance.isReachable
    }
}
