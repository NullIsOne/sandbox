//
//  ImageDownloader.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

protocol ImageTarget: class {
    func updateImage(_ image: UIImage)
}

protocol ImageDownloader {
    func downloadImage(withURL url: URL, toTarget target: ImageTarget)
}
