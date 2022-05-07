//
//  MovieDetailsView.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import Foundation
import UIKit

class MovieDetailsView: UIView{
    let thumbnailImageView = UIImageView()
    let stackView = UIStackView()
    
    let releaseDateLabels = VerticalLabels()
    let ratingLabels = VerticalLabels()
    let popularityLabels = VerticalLabels()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViewHierarchy()
        configureViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        addSubview(thumbnailImageView)
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.leading().top().height(250).width(160)
        
        stackView.addArrangedSubview(releaseDateLabels)
        stackView.addArrangedSubview(ratingLabels)
        stackView.addArrangedSubview(popularityLabels)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leading(withTrailingOf: thumbnailImageView, .leadingHorizontal).trailing().top(withTopOf: thumbnailImageView, .topVertical/2).bottom(withBottomOf: thumbnailImageView, .bottomVertical/2)
    }
    func configureViewProperties(){
        stackView.axis = .vertical
        stackView.spacing = 15
    }
}

