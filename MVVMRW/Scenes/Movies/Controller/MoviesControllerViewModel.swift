//
//  MoviesControllerViewModel.swift
//  MVVMRW
//
//  Created by ITAU on 28-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

protocol MoviesViewModel {
    var dataSource: MovieDataSource { get }
    var provider: MovieProvider { get }

    associatedtype ViewConfig
    func configure(view: ViewConfig)
}

struct MoviesControllerViewModel: MoviesViewModel {
    var provider: MovieProvider
    var dataSource: MovieDataSource

    func configure(view: MoviesViewController) {
        view.mainView.collectionView.delegate = view
        view.mainView.collectionView.dataSource = self.dataSource
    }

    typealias ViewConfig = MoviesViewController
}
