//
//  ImageDownloader.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

protocol ImageDownloader {
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell)
}
