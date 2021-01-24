//
//  ProductRepository.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

protocol ProductRepository {
    func fetchCategories(
        with completion: @escaping (Result<Categories, Error>) -> Void)

    func fetchProducts(
        for category: Category,
        page: Int,
        with completion: @escaping (Result<Product.Response, Error>) -> Void)

    func fetchLargeProduct(
        for product: Product,
        with completion: @escaping (Result<ProductDescription, Error>) -> Void)
}
