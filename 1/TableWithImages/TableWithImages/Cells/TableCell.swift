//
//  TableCell.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

public protocol TableCell: UITableViewCell {
    associatedtype Content
    func configure(with content: Content)
}

public extension UITableView {
    
    func register<Cell:TableCell>(cellType: Cell.Type) {
        register(cellType.self, forCellReuseIdentifier: cellType.description())
    }
    
    func dequeue<Cell:TableCell>(cellType: Cell.Type, for indexPath: IndexPath? = nil) -> Cell {
        guard let indexPath = indexPath else {
            return dequeueReusableCell(withIdentifier: cellType.description()) as! Cell
        }
        return dequeueReusableCell(withIdentifier: cellType.description(), for: indexPath) as! Cell
    }
    
    func dequeueAndConfigure<Cell:TableCell>(cellType: Cell.Type, for indexPath: IndexPath? = nil, content: Cell.Content) -> Cell {
        let cell = dequeue(cellType: cellType, for: indexPath)
        cell.configure(with: content)
        return cell
    }
}
