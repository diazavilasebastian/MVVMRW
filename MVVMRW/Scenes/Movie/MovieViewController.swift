//
//  MovieViewController.swift
//  MVVMRW
//
//  Created by ITAU on 17-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSUI

protocol MovieViewModelProtocol {
    var title: String { get }
    var image: UIImage { get }
    var overview: String { get }
    var popularity: Double { get }  
}


class MovieViewController: UIViewController {

    lazy var mainView: MovieDetailView = {
        let view = MovieDetailView(title: self.viewModel.title,
                                   image: self.viewModel.image,
                                   frame: .zero)
        view.
        return view
    }()

    var viewModel: MovieViewModel

    init(viewModel: MovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
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

}
