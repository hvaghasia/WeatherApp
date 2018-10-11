//
//  String+Helper.swift
//  Common
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

public extension String {
    
    // MARK: - Helper variables
    
    var localized: String {
        return NSLocalizedString(self, tableName: Constants.LocalizableFiles.english, bundle: Bundle.main, value: "", comment: "")
    }
}
