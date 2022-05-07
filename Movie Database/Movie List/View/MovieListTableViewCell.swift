//
//  MovieListTableViewCell.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell{
    let thumbnailImageView = UIImageView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    var viewModel = MovieListTableViewCellViewModel(){
        didSet{
            thumbnailImageView.setImage(with: viewModel.getImageDownloadURLString(), onFailureImage: nil)
            titleLabel.text = viewModel.getTitle()
            descriptionLabel.text = viewModel.getDescription()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViewHierarchy()
        configureViewProperties()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        [thumbnailImageView, titleLabel, descriptionLabel].forEach({
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        thumbnailImageView
            .leading(.leadingHorizontal).top(.topVertical).bottom(.bottomVertical).width(40).height(70)
        
        titleLabel
            .top(withTopOf: thumbnailImageView, 5).leading(withTrailingOf: thumbnailImageView, .leadingHorizontal/2).trailing(.trailingHorizontal)
        
        descriptionLabel
            .top(withBottomOf: titleLabel, .topVertical/2).leading(withTrailingOf: thumbnailImageView, .leadingHorizontal/2).trailing(.trailingHorizontal)
    }
    
    func configureViewProperties(){
        thumbnailImageView.layer.cornerRadius = 5
        thumbnailImageView.clipsToBounds = true
        
        titleLabel.numberOfLines = 1
        
        descriptionLabel.numberOfLines = 2
    }
}
