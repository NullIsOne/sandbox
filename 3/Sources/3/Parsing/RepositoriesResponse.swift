//
//  RepositoriesResponse.swift
//  3
//
//  Created by Nikita Korobeinikov on 24.07.2020.
//

enum RepositoriesResponse {
    case success([Repository])
    case error(RepositoriesError)
}
