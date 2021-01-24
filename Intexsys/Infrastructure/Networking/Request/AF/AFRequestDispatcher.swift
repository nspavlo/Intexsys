//
//  AFRequestDispatcher.swift
//  Intexsys
//
//  Created by Jans Pavlovs on 24/01/2021.
//

import Alamofire

// MARK: Initialization

final class AFRequestDispatcher {
    let environment: Environment

    init(environment: Environment) {
        self.environment = environment
    }
}

// MARK: RequestDispatcher

extension AFRequestDispatcher: RequestDispatcher {
    func execute<T>(_ request: Request, completion: @escaping (Result<T, Error>) -> Void) where T: Decodable {
        let dictionary = [
            "x-apikey:": "58a12ef1e09a105d95e19f6a5399de6174198b4cbb228365d0c2f8601487"
                + "fe070346a4905c6cb06f4347b7c6b5a224d592afb88b96c700b400bf5d72be6bfc77"
        ]

        AF
        .request(
            environment.path + request.path,
            method: HTTPMethod(rawValue: request.method.rawValue),
            headers: HTTPHeaders(dictionary)
        )
        .responseDecodable(of: T.self) { response in
            let result = response.result.mapError { $0 as Error }
            completion(result)
        }
    }
}
