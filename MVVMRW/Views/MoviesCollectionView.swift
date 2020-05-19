//
//  MoviesCollectionView.swift
//  MVVMRW
//
//  Created by ITAU on 19-05-20.
//  Copyright © 2020 iOSDemos. All rights reserved.
//

import Foundation
import UIKit

class MoviesCollectionView: UIView {

    lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()

    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        setupView()
    }

    @available(*,unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupView() {
        self.setupHierarchy()
        self.setupConstraints()
        self.configView()
    }

    func setupHierarchy() {
        self.addSubview(collectionView)
    }

    func delegateCollection(_ delegate: UICollectionViewDelegate) {
        self.collectionView.delegate = delegate
    }

    func daatasourceCollection (_ datasource: UICollectionViewDataSource) {
        self.collectionView.dataSource = datasource
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            .init(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0),
            .init(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0),
            .init(item: self, attribute: .trailing, relatedBy: .equal, toItem: collectionView, attribute: .trailing, multiplier: 1.0, constant: 0),
            .init(item: self, attribute: .bottom, relatedBy: .equal, toItem: collectionView, attribute: .bottom, multiplier: 1.0, constant: 0),
        ])
    }

    func configView() {

    }

}
