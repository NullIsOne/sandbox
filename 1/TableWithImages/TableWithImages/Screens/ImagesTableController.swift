//
//  TableViewController.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class ImagesTableController: UIViewController {
        
    private let tableView: UITableView = {
        $0.separatorStyle = .none
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UITableView())
        
    private let tableAdapter: TableAdapter = ImagesTableAdapter(factory: ImagePlaceholderURLFactory(width: 375, height: 150),
                                                                downloader: ImageURLSessionDownloader())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.matchSafeArea()
        tableView.delegate = self
        tableView.dataSource = tableAdapter
        
        tableAdapter.items = Array(1...100)
        tableView.reloadData()
    }

}

extension ImagesTableController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
}
