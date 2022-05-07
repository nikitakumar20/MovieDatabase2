//
//  UIView + Constraints.swift
//  Movie Database
//
//  Created by Nikita on 5/7/22.
//

import UIKit

// constraints
extension UIView{
    
    @discardableResult func top(_ constant: CGFloat? = nil,fromSafeArea: Bool = true) -> UIView{
        if let superview = superview{
            topAnchor.constraint(equalTo: fromSafeArea ? superview.safeAreaLayoutGuide.topAnchor : superview.topAnchor, constant: constant ?? 0).isActive = true
        }
        return self
    }
    @discardableResult func bottom(_ constant: CGFloat? = nil,fromSafeArea: Bool = true) -> UIView{
        if let superview = superview{
            bottomAnchor.constraint(equalTo: fromSafeArea ? superview.safeAreaLayoutGuide.bottomAnchor : superview.bottomAnchor, constant: constant ?? 0).isActive = true
        }
        return self
    }
    
    @discardableResult func leading(_ constant: CGFloat? = nil,fromSafeArea: Bool = true) -> UIView{
        if let superview = superview{
            leadingAnchor.constraint(equalTo: fromSafeArea ? superview.safeAreaLayoutGuide.leadingAnchor : superview.leadingAnchor, constant: constant ?? 0).isActive = true
        }
        return self
    }

    @discardableResult func trailing(_ constant: CGFloat? = nil,fromSafeArea: Bool = true) -> UIView{
        if let superview = superview{
            trailingAnchor.constraint(equalTo: fromSafeArea ? superview.safeAreaLayoutGuide.trailingAnchor : superview.trailingAnchor, constant: constant ?? 0).isActive = true
        }
        return self
    }
    
    @discardableResult func height(_ constant: CGFloat) -> UIView{
        heightAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    @discardableResult func width(_ constant: CGFloat) -> UIView{
        widthAnchor.constraint(equalToConstant: constant).isActive = true
        return self
    }
    
    // with other view
    @discardableResult func top(withBottomOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        topAnchor.constraint(equalTo: view.bottomAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func top(withTopOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        topAnchor.constraint(equalTo: view.topAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func bottom(withTopOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        bottomAnchor.constraint(equalTo: view.topAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func leading(withTrailingOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func leading(withLeadingOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func trailing(withLeadingOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func trailing(withTrailingOf view: UIView,_ constant: CGFloat? = nil) -> UIView{
        trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    
    // center
    @discardableResult func centerX() -> UIView{
        if let superview = superview{
            centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        }
        return self
    }
    @discardableResult func centerX(with view: UIView) -> UIView{
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        return self
    }
    @discardableResult func centerY(_ constant: CGFloat = 0) -> UIView{
        if let superview = superview{
            centerYAnchor.constraint(equalTo: superview.centerYAnchor, constant: constant).isActive = true
        }
        return self
    }
    @discardableResult func centerY(with view: UIView, _ constant: CGFloat = 0) -> UIView{
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
        return self
    }
    // add in view
//    @discardableResult func addIn(_ view: UIView) -> UIView{
//        view.addSubview(self)
//        self.translatesAutoresizingMaskIntoConstraints = false
//        return self
//    }
    // bottom with bottom
    @discardableResult func bottom(withBottomOf view: UIView, fromSafeArea: Bool = true,_ constant: CGFloat? = nil) -> UIView{
        bottomAnchor.constraint(equalTo: fromSafeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor, constant: constant ?? 0).isActive = true
        return self
    }
    @discardableResult func widthAndHeight(_ constant: CGFloat) -> UIView{
        width(constant).height(constant)
    }
}
