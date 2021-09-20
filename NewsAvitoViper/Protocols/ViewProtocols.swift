//
//  ViewProtocols.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//
import Foundation

protocol ReusableView: class {}

protocol NibLoadableView: class {}

protocol IndicateTableView: class {
    func showLoading()
    func hideLoading()
}
