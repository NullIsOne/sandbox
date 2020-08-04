//
//  UIView+MatchParent.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

extension UIView {
    
    func matchSuperview(with inset: UIEdgeInsets = .zero) {
        
        guard let superview = self.superview else {
            fatalError("`superview` was nil – call `addSubview(view: UIView)` before calling `matchSuperview`")
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.topAnchor,
                                 constant: inset.top),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor,
                                    constant: -inset.bottom),
            leadingAnchor.constraint(equalTo: superview.leadingAnchor,
                                     constant: inset.left),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor,
                                      constant: -inset.right)
        ])
        
    }
    
    func matchSafeArea(with inset: UIEdgeInsets = .zero) {
        guard let superview = self.superview else {
            fatalError("`superview` was nil – call `addSubview(view: UIView)` before calling `matchSafeArea`")
        }

        self.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.topAnchor,
                                 constant: inset.top),
            bottomAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.bottomAnchor,
                                    constant: -inset.bottom),
            leadingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.leadingAnchor,
                                     constant: inset.left),
            trailingAnchor.constraint(equalTo: superview.safeAreaLayoutGuide.trailingAnchor,
                                      constant: -inset.right)
        ])
    }
    
}
