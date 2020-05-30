//
//  MovieViewController.swift
//  MVVMRW
//
//  Created by ITAU on 17-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSUI
import iOSMovieDB

protocol MovieViewModelProtocol {
    var title: String { get }
    var image: UIImage { get }
    var overview: String { get }
    var popularity: String { get }
    var idMovie: Int { get }

    func configure(view: MovieDetailView)
}

class MovieViewController: UIViewController {

    lazy var mainView: MovieDetailView = {
        let view = MovieDetailView(title: self.viewModel.title,
                                   image: self.viewModel.image,
                                   frame: .zero)
        return view
    }()

    var viewModel: MovieViewModelProtocol
    var provider: MovieProvider

    init(viewModel: MovieViewModelProtocol, provider: MovieProvider) {
        self.viewModel = viewModel
        self.provider = provider
        super.init(nibName: nil, bundle: nil)
        viewModel.configure(view: mainView)
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configNavigation()
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        self.view = mainView
        fetchMovieDetail()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }

    private func configNavigation() {
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }

    func fetchMovieDetail() {
        provider.getMovie(id: viewModel.idMovie) { result in
            switch result {
            case .success(let detail):
                let viewModel = MovieDetailViewModel(movie: detail)
                viewModel.configure(view: self.mainView)
            default:
                break
            }
        }
    }

}
