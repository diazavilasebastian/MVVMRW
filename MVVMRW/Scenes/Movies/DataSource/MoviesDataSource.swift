//
//  MoviesDataSource.swift
//  MVVMRW
//
//  Created by ITAU on 17-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB

class MovieDataSource: NSObject {

    private var movies: [MovieResume]

    override init() {
        movies = []
    }

    func appendMovies(newMovies: [MovieResume]) {
        movies.append(contentsOf: newMovies)
    }

    func getMovie(index: Int) -> MovieResume? {
        return movies[index]
    }

}

extension MovieDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let movie = movies[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MovieCollectionCell.identifier, for: indexPath) as! MovieCollectionCell
        let viewModel = MovieResumeCellViewModel(movie: movie)
        viewModel.configure(cell: cell)
        return cell
    }

}
