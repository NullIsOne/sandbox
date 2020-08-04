//
//  CollectionCell.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

public protocol CollectionCell: UICollectionViewCell {
    associatedtype Content
    func configure(with content: Content)
}

public extension UICollectionView {
    
    func register<Cell: CollectionCell>(cellType: Cell.Type) {
        register(cellType.self, forCellWithReuseIdentifier: cellType.description())
    }
    
    func dequeue<Cell: CollectionCell>(cellType: Cell.Type, for indexPath: IndexPath) -> Cell {
        return dequeueReusableCell(withReuseIdentifier: cellType.description(), for: indexPath) as! Cell
    }
    
    func dequeueAndConfigure<Cell:CollectionCell>(cellType: Cell.Type, for indexPath: IndexPath, content: Cell.Content) -> Cell {
        let cell = dequeue(cellType: cellType, for: indexPath)
        cell.configure(with: content)
        return cell
    }
    
}
