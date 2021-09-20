 //
//  AppRoot.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//


import UIKit
 
 
 protocol RootWireframe: class {
     func presentRootScreen(in window: UIWindow)
 }
 class AppRoot: RootWireframe {
    
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = MainAppViewController()
    }
    
 }
