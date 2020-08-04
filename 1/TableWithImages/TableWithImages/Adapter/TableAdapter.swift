//
//  TableAdapter.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 03.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class TableAdapter<T>: NSObject, Adapter, UITableViewDataSource {
    typealias Item = T
    
    typealias CellConfigurator = (UITableView, T) -> UITableViewCell
    
    var items: [T] = []
    
    private let cellConfigurator: CellConfigurator
    
    init(cellConfigurator: @escaping CellConfigurator) {
        self.cellConfigurator = cellConfigurator
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        cellConfigurator(tableView, items[indexPath.row])
    }
}
