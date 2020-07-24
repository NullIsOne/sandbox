//
//  RepositoriesError.swift
//  3
//
//  Created by Nikita Korobeinikov on 24.07.2020.
//

enum RepositoriesError {
    case emptyResult
    case unknown(reason: Error?)
    
    var description: String {
        switch self {
        case .emptyResult:
            return "0 repositories found"
        case .unknown(let reason):
            return "Error while sending request \(reason.debugDescription)"
        }
    }
}
