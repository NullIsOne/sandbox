//
//  ImagesCollectionAdapter.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

final class ImagesCollectionAdapter: CollectionAdapter<Int> {
    
    private let factory: ImageURLFactory
    
    init(factory: ImageURLFactory) {
        self.factory = factory
        super.init(cellConfigurator: { collection, item in
            let cell = collection.dequeue(cellType: ImageCollectionCell.self,
                                          for: IndexPath(item: item, section: 0))
            let imageUrl = factory.getImage(urlFor: item)
            cell.configure(with: imageUrl)
            return cell
        })
    }
    
}
