//
//  Photo.swift
//  PinterestDuplicate
//
//  Created by Alua Sayabayeva on 2023-04-12.
//

import Foundation

struct Photo: Codable, Equatable {
    let id: String
    let author: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case id, author
        case url = "download_url"
    }
    init(id: String, author: String, url: String) {
        self.id = id
        self.author = author
        self.url = url
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.author = try container.decode(String.self, forKey: .author)
        self.url = try container.decode(String.self, forKey: .url)
    }
}
