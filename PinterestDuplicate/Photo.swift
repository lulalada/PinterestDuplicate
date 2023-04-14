//
//  Photo.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import Foundation

struct Photo: Decodable {
    let id: String
    let author: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, author
        case url = "download_url"
    }
}
