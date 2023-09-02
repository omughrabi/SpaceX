//
//  Extension.swift
//  SpaceX
//
//  Created by Omar on 02.09.23.
//

import UIKit

extension UIView {
    func addSubViews (_ views: UIView...) {
        
        views.forEach({
            addSubview($0)
        })
        
    }
}
