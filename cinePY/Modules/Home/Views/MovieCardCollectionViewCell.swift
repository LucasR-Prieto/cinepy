//
//  File.swift
//  cinePY
//
//  Created by lucas on 2024-06-21.
//

import Foundation
import UIKit

class MovieCardCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "MovieCardCell"
    
    let movieCardView = MovieCardView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        contentView.addSubview(movieCardView)
        movieCardView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            movieCardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            movieCardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            movieCardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            movieCardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
