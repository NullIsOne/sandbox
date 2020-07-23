//
//  ImageURLFactory.swift
//  TableWithImages
//
//  Created by Nikita Korobeinikov on 23.07.2020.
//  Copyright © 2020 NullIsOne. All rights reserved.
//

import Foundation

protocol ImageURLFactory {
    func getImage(urlFor index: Int) -> URL
}
