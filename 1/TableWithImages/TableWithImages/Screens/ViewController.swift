//
//  ViewController.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private enum Feature: String, CaseIterable {
        case table, collection
    }
    
    private let tableView: UITableView = {
        $0.separatorStyle = .none
        $0.showsHorizontalScrollIndicator = false
        $0.showsVerticalScrollIndicator = true
        return $0
    }(UITableView())
        
    private let tableAdapter = TableAdapter<Feature> { tableView, item in
        let identifier = "featurecell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            ?? UITableViewCell(style: .default, reuseIdentifier: identifier)
        cell.textLabel?.text = item.rawValue
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.matchSafeArea()
        tableView.delegate = self
        tableView.dataSource = tableAdapter
        
        tableAdapter.items = Feature.allCases
        tableView.reloadData()
    }

}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        75
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = tableAdapter.items[indexPath.row]
        
        switch item {
        case .table:
            present(ImagesTableController(), animated: true, completion: nil)
        case .collection:
            present(ImagesCollectionController(), animated: true, completion: nil)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
}
