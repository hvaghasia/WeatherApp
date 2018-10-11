//
//  UINavigation+Helper.swift
//  Common
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public extension UINavigationController {
    
    // MARK: - NavigationBar UI
    
    func beatifyNavigationBar() {
        navigationBar.barTintColor = AppTheme.navigationBarBackgroundColor
        navigationBar.tintColor = .white
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }
}
