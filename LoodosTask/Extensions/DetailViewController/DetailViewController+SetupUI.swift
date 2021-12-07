//
//  DetailViewController+SetupUI.swift
//  LoodosTask
//
//  Created by Cem Eke on 6.12.2021.
//

import Foundation

extension DetailVC {
    func setupUI(){
        imageView.kf.setImage(with: URL(string: movieDetail?.poster ?? ""))
        lblTitle.text = "Title : " + "\(movieDetail?.title ?? "")"
        lblRated.text = "Rated : " + "\(movieDetail?.rated ?? "")"
        lblYear.text = "Year : " + "\(movieDetail?.year ?? "")"
        lblReleased.text = "Released : " + "\(movieDetail?.released ?? "")"
    }
}
