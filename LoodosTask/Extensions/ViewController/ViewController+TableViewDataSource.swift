//
//  MainViewController+TableViewDataSource.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation
import UIKit

//MARK: - TableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
        //Normally we must return all movie list count but i returned static number as agreed with Lodoos.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = viewModel.movie.title
        return cell
    }
}
