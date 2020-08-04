//
//  ImagesCollectionController.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class ImagesCollectionController: UIViewController {
        
    private let collection: UICollectionView = {
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UICollectionView())
        
//    private let collectionAdapter: CollectionAdapter = ImagesTableAdapter(factory: ImagePlaceholderURLFactory(width: 375, height: 150),
//                                                                          downloader: ImageURLSessionDownloader())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        collection.matchSafeArea()
//        tableView.delegate = self
//        collection.dataSource = tableAdapter
        
//        collection.items = Array(1...100)
        collection.reloadData()
    }

}
