//
//  ImageURLSessionDownloader.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit
import Foundation

final class ImageURLSessionDownloader: ImageDownloader {
    func downloadImage(withURL url: URL, toTarget target: ImageTarget) {
        URLSession.shared.dataTask(with: url) { [weak target] data, _, _ in
            guard let data = data,
                let image = UIImage(data: data) else {
                return
            }
            DispatchQueue.main.async { [weak target] in
                target?.updateImage(image)
            }
        }.resume()
    }
}
