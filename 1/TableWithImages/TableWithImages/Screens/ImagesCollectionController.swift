//
//  ImagesCollectionController.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 04.08.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class ImagesCollectionController: UIViewController {
    
    fileprivate enum Constants {
        static let cellOffset: CGFloat = 24
        static let cellHeight: CGFloat = 200
        static let sectionInsetVertical: CGFloat = 8
    }
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width - 2 * Constants.cellOffset,
                                 height: Constants.cellHeight)
        layout.sectionInset = UIEdgeInsets(top: Constants.sectionInsetVertical,
                                           left: 0,
                                           bottom: Constants.sectionInsetVertical,
                                           right: 0)
        return layout
    }()
    
    private lazy var collection: UICollectionView = {
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        $0.register(cellType: ImageCollectionCell.self)
        $0.collectionViewLayout = UICollectionViewFlowLayout()
        return $0
    }(UICollectionView(frame: .zero, collectionViewLayout: flowLayout))
        
    private let collectionAdapter: CollectionAdapter = ImagesCollectionAdapter(factory: ImagePlaceholderURLFactory(width: 300,
                                                                                                                   height: 300))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collection)
        collection.matchSafeArea()
        collection.dataSource = collectionAdapter
        
        collectionAdapter.items = Array(1...200)
        collection.reloadData()
    }

}
