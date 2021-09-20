//
//  ReusableView.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import UIKit

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

