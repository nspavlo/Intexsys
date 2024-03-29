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
        "https://\(self.rawValue)"
    }

    case development = "www.opticsplanet.com"
    case images = "op1.0ps.us"
}
