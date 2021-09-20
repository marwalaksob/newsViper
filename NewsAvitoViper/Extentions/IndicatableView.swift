//
//  IndicatableView.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//

import Foundation
import PKHUD


extension IndicateTableView where Self: UIViewController {
    
    
    func showLoading() {
        HUD.show(.progress)
    }
    
    func hideLoading() {
        HUD.hide()
    }
}

