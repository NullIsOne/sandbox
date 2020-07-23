//
//  ViewController.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let cellIdentifier = "DefaultCell"
    
    private let tableView: UITableView = {
        $0.separatorStyle = .none
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UITableView())
    
    private let items: [Int] = Array(1...100)
    
    private let imageURLFactory: ImageURLFactory = ImagePlaceholderURLFactory(width: 375, height: 150)
    private let imageDownloader: ImageDownloader = ImageURLSessionDownloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.frame
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: cellIdentifier)
        
        let imageUrl = imageURLFactory.getImage(urlFor: indexPath.row)
        imageDownloader.downloadImage(withURL: imageUrl, forCell: cell)
        return cell
    }
    
}
