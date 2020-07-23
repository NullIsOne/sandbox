//
//  ImagePlaceholderURLFactory.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import Foundation

final class ImagePlaceholderURLFactory: ImageURLFactory {
    
    private let host = "http://placehold.it"
    private let width: Int
    private let height: Int
    
    init(width: Int, height: Int) {
        self.width = width
        self.height = height
    }
    
    func getImage(urlFor index: Int) -> URL {
        var components = URLComponents(string: "\(host)/\(width)x\(height)")
        components?.queryItems = [URLQueryItem(name: "text", value: "\(index)")]
        guard let url = components?.url else {
            fatalError("ImagePlaceholderURLFactory failed to create url for \(index)")
        }
        return url
    }
}
