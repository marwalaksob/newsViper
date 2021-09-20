//
//  MainAppViewController.swift
//  NewsAvitoViper
//
//  Created by AdriaML on 20/9/2021.
//


import UIKit

class MainAppViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        addTabbarItem()
    }
    
    func addTabbarItem() {
        
        let beritaPage = NewsRouter.assembleModule()
        
      
        
      //  let videoPage = VideosRouter.assembleModule()
       // videoPage.tabBarItem = UITabBarItem(tabBarSystemItem: .mostRecent, tag: 1)
        
        self.viewControllers = [beritaPage]
        
    }

}
