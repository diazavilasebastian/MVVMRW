//
//  ViewController.swift
//  MVVMRW
//
//  Created by ITAU on 17-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import UIKit
import iOSMovieDB

class MoviesViewController: UIViewController {

    var collectionView: MoviesCollectionView?

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MOVIES"
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

