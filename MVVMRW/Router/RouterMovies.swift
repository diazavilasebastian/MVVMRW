//
//  Router.swift
//  MVVMRW
//
//  Created by ITAU on 22-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB
import UIKit
import SDWebImage
import iOSUI

protocol RouterNavigation {
    var navigation: UINavigationController? { get }

    func start()
}

protocol RouterMovieFlow {
    func goToDetails(idMovie: Int)
    func goToDetails(movieResumen: MovieResume)
}

class RouterMovies: RouterNavigation {

    internal var navigation: UINavigationController?

    let provider: MovieProvider
    let service: ApiService


    init(navigation: UINavigationController ) {
        self.service = ApiService(apiKey: "6893e0b3a6030f46d850edf87283de46")
        self.provider = MovieProvider(service: service)
        self.navigation = navigation
    }

    func start() {
        guard let strongNavigation = self.navigation else { return }
        let viewModel = MoviesControllerViewModel(provider: provider,
                                                  dataSource: MovieDataSource(),
                                                  router: self)
        let moviesController = MoviesViewController(viewModel: viewModel)
        strongNavigation.setNavigationBarHidden(true, animated: false)
        strongNavigation.setViewControllers([moviesController], animated: false)
    }

}

extension RouterMovies: RouterMovieFlow {
    func goToDetails(idMovie: Int) {
        
    }

    func goToDetails(movieResumen: MovieResume) {
        guard let strongUrl = movieResumen.urlPoster?.absoluteString else{ return }
        if let image = SDImageCache.shared.imageFromDiskCache(forKey: strongUrl) {
            let viewModel = MovieViewModelResumen(movie: movieResumen, image: image)
            let detail = MovieViewController(viewModel: viewModel, provider: self.provider)
            self.navigation?.show(detail, sender: nil)
        }

    }

}
