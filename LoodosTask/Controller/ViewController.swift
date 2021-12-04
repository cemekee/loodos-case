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
    
    private let viewModel = MainVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.updateUI = {
            print("update")
            self.tableView.reloadData()
        }
        viewModel.fetchFilteredMovie(name: "terminal")
    }


    
}

// MARK: - Actions
extension ViewController {
    @IBAction func searchButtonTapped() {
        if let movie = txtSearch.text {
            let name = movie.replacingOccurrences(of: " ", with: "+")
            viewModel.fetchFilteredMovie(name: name)
        } else {
            //Arama yapmak istediğiniz movie name giriniz.
        }
    }
}

//MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
        vc!.movieDetail = self.viewModel.movie
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

//MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        //Normally we must return all movie list count but i returned static number as agreed with Lodoos IK.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.movie.title
        return cell
    }
    
    
}
