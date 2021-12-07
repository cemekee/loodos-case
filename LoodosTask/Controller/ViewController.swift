//
//  ViewController.swift
//  LoodosTask
//
//  Created by Cem Eke on 3.12.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var splashView: UIView!
    @IBOutlet weak var loginText: UILabel!
    
    let viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkConnection()
        RCValues.sharedInstance.updateLoginText = {
            self.loginText.text = RCValues.sharedInstance.loginTextFromFirebase
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.updateUI = {
            print("update")
            self.tableView.reloadData()
        }
        viewModel.fetchFilteredMovie(name: "terminal")
    }
    @objc func login() {
        splashView.isHidden = true
    }
}


