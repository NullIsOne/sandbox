//
//  ImagesAdapter.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 03.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

final class ImagesTableAdapter: TableAdapter<Int> {
    
    private enum Constants {
        static let cellIdentifier = "DefaultCell"
    }
    
    private let factory: ImageURLFactory
    private let downloader: ImageDownloader
    
    init(factory: ImageURLFactory, downloader: ImageDownloader) {
        self.factory = factory
        self.downloader = downloader
        super.init(cellConfigurator: { tableView, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier)
                ?? UITableViewCell(style: .default, reuseIdentifier: Constants.cellIdentifier)
            
            let imageUrl = factory.getImage(urlFor: item)
            downloader.downloadImage(withURL: imageUrl, toTarget: cell)
            return cell
        })
    }
    
}

extension UITableViewCell: ImageTarget {
    func updateImage(_ image: UIImage) {
        imageView?.image = image
        setNeedsLayout()
    }
}
