//
//  VerticalLabelsView.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import UIKit

class VerticalLabels: UIView{
    let stackView = UIStackView()
    let titleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        setupViewHierarchy()
        configureViewProperties()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViewHierarchy(){
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.leading().trailing().top().bottom()
    }
    func configureViewProperties(){
        stackView.axis = .vertical
    }
}
