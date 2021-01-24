//
//  Environment.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Foundation

// MARK: Initialization

enum Environment: String {
    var path: String {
        "https://\(self.rawValue)/api/0.5"
    }

    case development = "www.opticsplanet.com"
}
