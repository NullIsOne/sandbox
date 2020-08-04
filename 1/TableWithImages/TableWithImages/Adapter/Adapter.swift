//
//  Adapter.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

protocol Adapter {
    associatedtype Item
    var items: [Item] { get set }
}
