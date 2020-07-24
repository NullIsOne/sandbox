//
//  RepositoriesParser.swift
//  3
//
//  Created by Nikita Korobeinikov on 24.07.2020.
//

import Alamofire
import Foundation

struct RepositoriesParser {
    
    static func parse(dataReposne: AFDataResponse<Data?>) -> RepositoriesResponse {
        guard let statusCode = dataReposne.response?.statusCode else {
            return .error(.unknown(reason: dataReposne.error))
        }
        switch (statusCode) {
        case 200:
            if let data = dataReposne.data,
                let repositories = try? JSONDecoder().decode([Repository].self, from: data) {
                return .success(repositories)
            } else {
                return .error(.emptyResult)
            }
        default:
            return .error(.unknown(reason: dataReposne.error))
        }
    }
    
}
