//
//  MovieViewModel.swift
//  MVVMRW
//
//  Created by ITAU on 29-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB
import SDWebImage
import iOSUI

struct MovieViewModelResumen: MovieViewModelProtocol {
    private var movieResume: MovieResume
    
    var image: UIImage
    var title: String
    var overview: String
    var popularity: String
    var idMovie: Int

    init(movie: MovieResume, image: UIImage) {
        self.movieResume = movie
        self.image = image
        self.title = self.movieResume.title
        self.overview = movieResume.overview
        self.idMovie = movie.id
        self.popularity = String(movieResume.popularity)
    }

    func configure(view: MovieDetailView) {
        view.title = self.title
        view.image = self.image
        view.overViewLabel.detail = self.overview
        view.popularityLabel.score = self.popularity
    }

}

struct MovieDetailViewModel: MovieViewModelProtocol {
    private var movie: Movie
    var image: UIImage = UIImage()
    var title: String
    var overview: String
    var popularity: String
    var tagLine: String
    var idMovie: Int

    init(movie: Movie) {
        self.movie = movie
        self.title = movie.title
        self.overview = movie.overview
        self.idMovie = movie.id
        self.popularity = String(movie.popularity)
        self.tagLine = movie.tagline ?? ""
    }

    func configure(view: MovieDetailView) {
        view.title = self.title
        view.overViewLabel.detail = self.overview
        view.popularityLabel.score = self.popularity
        view.tagLineLabel.detail = self.tagLine

        if let genresMovie = movie.genres {
            genresMovie.forEach({ genre in
                view.genresViews.stackView.addArrangedSubview(labelForString(text: genre.name))
            })
        }

        if let compani = movie.productionCompanies {
            compani.forEach({ compani in
                view.companyViews.stackView.addArrangedSubview(labelForString(text: compani.name))
            })
        }
    }

    func labelForString(text: String ) -> UILabel {
        let label = UILabel(frame: .zero)
        label.text = text
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 22, weight: .medium)
        return label
    }
}
