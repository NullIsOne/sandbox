//
//  ImageCollectionCell.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

final class ImageCollectionCell: UICollectionViewCell, CollectionCell {
    
    typealias Content = URL
    
    private lazy var imageDownloader: ImageDownloader = ImageURLSessionDownloader()
    
    private let imageView: UIImageView = {
        $0.contentMode = .scaleAspectFit
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func customInit() {
        contentView.addSubview(imageView)
        imageView.matchSuperview()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    func configure(with content: Content) {
        imageDownloader.downloadImage(withURL: content, toTarget: self)
    }
    
}

extension ImageCollectionCell: ImageTarget {
    
    func updateImage(_ image: UIImage) {
        imageView.image = image
        setNeedsDisplay()
    }
    
}
