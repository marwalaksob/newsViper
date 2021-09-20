//
//  NibLoadableView.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//
import UIKit

extension NibLoadableView where Self: UIView {
    
    static var NibName: String {
        return String(describing: self)
    }
}

