//
//  CollectionAdapter.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class CollectionAdapter<T>: NSObject, Adapter, UICollectionViewDataSource {
    typealias Item = T
    
    typealias CellConfigurator = (UICollectionView, T) -> UICollectionViewCell
    
    var items: [T] = []
    
    private let cellConfigurator: CellConfigurator
    
    init(cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellConfigurator(collectionView, items[indexPath.row])
    }
}
