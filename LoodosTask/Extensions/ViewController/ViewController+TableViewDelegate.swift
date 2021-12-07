//
//  MainViewController+TableViewDelegate.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation
import UIKit

//MARK: - TableViewDelegate
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
        vc!.movieDetail = self.viewModel.movie
        self.navigationController?.pushViewController(vc!, animated: true)
    }
}
