//
//  ViewController+Actions.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation

// MARK: - Actions
extension ViewController {
    @IBAction func searchButtonTapped() {
        // let movie = txtSearch.text {
        let name = txtSearch.text?.replacingOccurrences(of: " ", with: "+")
        viewModel.fetchFilteredMovie(name: name ?? "")
    }
}
