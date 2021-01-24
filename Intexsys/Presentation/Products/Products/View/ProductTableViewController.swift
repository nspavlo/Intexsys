//
//  ProductTableViewController.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import UIKit

// MARK: Initialization

final class ProductTableViewController: UITableViewController {
    let items: ProductListItemViewModels
    var didSelectItem: ((IndexPath) -> Void)?

    init(items: ProductListItemViewModels) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(cellType: ProductTableViewCell.self)
    }
}

// MARK: UITableViewDataSource, UITableViewDelegate

extension ProductTableViewController {
    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(for: indexPath) as ProductTableViewCell
        cell.configure(with: items[indexPath.row])
        return cell
    }

    override func tableView(_: UITableView, didSelectRowAt indexPath: IndexPath) {
        didSelectItem?(indexPath)
    }
}
