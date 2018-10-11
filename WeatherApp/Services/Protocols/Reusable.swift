//
//  Reusable.swift
//  WeatherApp
//
//  Created by admin on 11/10/18.
//  Copyright © 2018 Ugam. All rights reserved.
//

import Foundation

import Foundation
import UIKit

/// Make `UICollectionViewCell` subclasses
/// conform to this protocol to be able to dequeue them in a type-safe manner
protocol Reusable: class {
    /// The reuse identifier to use when registering and later dequeuing a reusable cell
    static var reuseIdentifier: String { get }
}

// MARK: - Reusable protocol default implementation

extension Reusable {
    /// By default, use the name of the class as String for its reuseIdentifier
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

// Confirm UITableViewCell class to Reusable protocol to use generic dequeue method
extension UITableViewCell: Reusable {}

// MARK: - Dequeue method

extension UITableView {
    /**
     Returns a reusable `UITableViewCell` object for the class inferred by the return-type
     - parameter indexPath: Indexpath for cell
     - parameter cellType: Type of given cell
     */
    final func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                """
                Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
                "Check that the reuseIdentifier is set properly in your XIB/Storyboard
                """
            )
        }
        return cell
    }
}
