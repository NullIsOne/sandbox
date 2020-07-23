//
//  ImageURLSessionDownloader.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import UIKit
import Foundation

final class ImageURLSessionDownloader: ImageDownloader {
    /// - Возможные улучшения
    /// * Добавить кэширование загруженных картинок
    /// * Добавить префетчинг (UITableViewDataSourcePrefetching) в ViewController и заранее заполнять кэш
    /// * Посчитал, что это будет излишним, т.к. в задаче необходимость кэширования не упомянута
    func downloadImage(withURL url: URL, forCell cell: UITableViewCell) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let image = UIImage(data: data) else { return }
            DispatchQueue.main.async { [weak cell] in
                cell?.imageView?.image = image
                cell?.setNeedsLayout()
            }
            }.resume()
    }
}
