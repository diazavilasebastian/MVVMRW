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

    lazy var mainView: MoviesCollectionView = {
        let view = MoviesCollectionView(frame: .zero)
        view.collectionView.dataSource = self.dataSource
        view.collectionView.delegate = self
        view.collectionView.register(MovieCollectionCell.self, forCellWithReuseIdentifier: MovieCollectionCell.identifier)
        return view
    }()

    private var provider: ProviderProtocol
    private var dataSource: MovieDataSource
    private var navigation: RouterMovies

    private var fetchingData: Bool = false
    private var page: Int = 1

    init(viewModel: MoviesControllerViewModel) {
        self.provider = viewModel.provider
        self.dataSource = viewModel.dataSource
        self.navigation = viewModel.router
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
        fetchData()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func fetchData() {
        self.fetchingData.toggle()
        provider.getPopular(page: page) { [weak self] result in
            self?.fetchingData.toggle()
            switch result {
            case .success(let movies):
                self?.page += 1
                self?.appendMovies(movies: movies)
            default:
                break
            }
        }
    }

    private func appendMovies(movies: PageMovies) {
        dataSource.appendMovies(newMovies: movies.results)
        mainView.collectionView.reloadData()
    }

}

extension MoviesViewController: UICollectionViewDelegate, UIScrollViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let movieResume = dataSource.getMovie(index: indexPath.row) {
            navigation.goToDetails(movieResumen: movieResume)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        //FAKE infinite scroll
        if scrollView.contentOffset.y + scrollView.frame.size.height >= scrollView.contentSize.height {
            if !fetchingData { fetchData() }
        }
    }
}

extension MoviesViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = ((collectionView.bounds.size.width/2) - 10)
        let height: CGFloat = 320
        return CGSize(width: width, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
}
