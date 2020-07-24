//
//  LoginChecker.swift
//  LoginChecker
//
//  Created by Nikita Korobeinikov on 24.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

struct LoginChecker {
    
    private static let allowedStartCharactersRegex = try! NSRegularExpression(pattern: "[A-Za-z]")
    private static let allowedCharactersRegex = try! NSRegularExpression(pattern: "[A-Za-z0-9@.-]")
        
    static func isValid(login: String) -> Bool {
        guard login.count >= 3, login.count <= 32 else {
            return false
        }
        
        let allowedStartCharactersMatch = allowedStartCharactersRegex.firstMatch(in: login,
                                                                                 options: [],
                                                                                 range: NSRange(location: 0, length: 1))
        guard allowedStartCharactersMatch != nil else {
            return false
        }
        
        let allowedCharactersMatches = allowedCharactersRegex.matches(in: login,
                                                                      options: [],
                                                                      range: NSRange(location: 0,
                                                                                     length: login.count))
        return allowedCharactersMatches.count == login.count
    }
}
