//
//  MovieResumeCollectionCell.swift
//  MVVMRW
//
//  Created by ITAU on 24-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import UIKit

class MovieCollectionCell: UICollectionViewCell {

    static let identifier : String = "MOVIECELL"

    lazy var poster: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .white
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupConstrains()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupConstrains() {
        self.contentView.addSubview(poster)

        NSLayoutConstraint.activate([
            .init(item: poster, attribute: .topMargin, relatedBy: .equal, toItem: self.contentView, attribute: .topMargin, multiplier: 1.0, constant: 0),
            .init(item: poster, attribute: .leading, relatedBy: .equal, toItem: self.contentView, attribute: .leading, multiplier: 1.0, constant: 0),
            .init(item: self.contentView, attribute: .bottom, relatedBy: .equal, toItem: poster, attribute: .bottom, multiplier: 1.0, constant: 0),
            .init(item: self.contentView, attribute: .trailing, relatedBy: .equal, toItem: poster, attribute: .trailing, multiplier: 1.0, constant: 0)
        ])

        self.contentView.backgroundColor = .white
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.clipsToBounds = true
   }

}
