//
//  DetailVC.swift
//  LoodosTask
//
//  Created by Cem Eke on 4.12.2021.
//

import Foundation
import UIKit
import Kingfisher
import Firebase

class DetailVC: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRated: UILabel!
    @IBOutlet weak var lblReleased: UILabel!
    
    let ref = Database.database().reference(withPath: "movie-items")
    var refObservers: [DatabaseHandle] = []
    
    var movieDetail: Movie?
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.addItemToFirebaseDB(mv: movieDetail)
        viewModel.updateFirebaseAnalystics(mv: movieDetail)
    }
}


