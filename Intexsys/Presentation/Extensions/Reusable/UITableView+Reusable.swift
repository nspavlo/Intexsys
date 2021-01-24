//
//  UITableView+Reusable.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Registration

extension UITableView {
    func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
        register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
    }
}

// MARK: Dequeue

extension UITableView {
    // swiftlint:disable line_length
    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
        guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
            fatalError(
                "Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) "
                    + "matching type \(cellType.self). "
                    + "Check that you registered the cell beforehand"
            )
        }

        return cell
    }
}
