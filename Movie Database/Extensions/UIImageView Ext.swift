//
//  UIImageView Ext.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import UIKit
import Kingfisher

extension UIImageView{
    func setImage(with urlString: String?,onFailureImage: KFCrossPlatformImage?, placeholder: Placeholder? = nil, completionHandler: ((Result<RetrieveImageResult, KingfisherError>) -> Void)? = nil){
        kf.indicatorType = .activity
        kf.setImage(
            with: URL(string: urlString ?? ""),
            placeholder:placeholder,
            options: [
                
                //.processor(SVGImgProcessor()),
                .onFailureImage(onFailureImage),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
                
                //.cacheOriginalImage
            ],completionHandler: completionHandler ?? {
                result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.absoluteString ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            })
        
    }
}
