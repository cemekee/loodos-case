//
//  ViewController+CheckConnection.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation
import UIKit

extension ViewController {
    func checkConnection() {
        if Connectivity.isConnectedToInternet {
            self.loginText.text = RCValues.sharedInstance.loginTextFromFirebase
            let timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(self.login), userInfo: nil, repeats: true)
        } else {
            let alert = UIAlertController(title: "Internet Connection Not Found", message: "Check your connection and try again.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default ))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
