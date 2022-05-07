//
//  MovieDetailsViewController.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    let scrollView = UIScrollView()
    let movieDetailsView = MovieDetailsView()
    
    let viewModel: MovieDetailsViewModel
    
    init(_ viewModel: MovieDetailsViewModel){
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leading().trailing().top().bottom()
        
        scrollView.addSubview(movieDetailsView)
        movieDetailsView.translatesAutoresizingMaskIntoConstraints = false
        
        movieDetailsView.leading(.leadingHorizontal).trailing(.trailingHorizontal).top(.topVertical).bottom(.bottomVertical)
        
        NSLayoutConstraint.activate([
            movieDetailsView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: CGFloat.topVertical*2)
        ])
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        movieDetailsView.thumbnailImageView.setImage(with: viewModel.getImageDownloadURLString(), onFailureImage: nil)
        
        movieDetailsView.releaseDateLabels.titleLabel.text = "Release Date"
        movieDetailsView.releaseDateLabels.descriptionLabel.text = viewModel.getReleaseDate()
        
        movieDetailsView.ratingLabels.titleLabel.text = "Rating"
        movieDetailsView.ratingLabels.descriptionLabel.text = viewModel.getRating()
        
        movieDetailsView.ratingLabels.titleLabel.text = "Popularity"
        movieDetailsView.ratingLabels.descriptionLabel.text = viewModel.getPopularity()
    }
}
