//
//  MovieResumeCollectionCellViewModel.swift
//  MVVMRW
//
//  Created by ITAU on 25-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import iOSMovieDB
import SDWebImage

class MovieResumeCellViewModel {
    
    private let movieResume: MovieResume

    public var posterUrl: URL? {
        self.movieResume.urlPoster
    }

    init(movie: MovieResume) {
        self.movieResume = movie
    }

    func configure(cell : MovieCollectionCell) {
        guard let strongUrl = self.posterUrl?.absoluteString else{ return }
        if let image = SDImageCache.shared.imageFromDiskCache(forKey: strongUrl) {
            cell.poster.image = image
        } else {
            cell.poster.sd_setImage(with: self.posterUrl , completed: nil)
        }
        cell.backgroundColor = .black
    }
}
