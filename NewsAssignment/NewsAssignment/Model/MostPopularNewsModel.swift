//
//  MostPopularNewsModel.swift
//  NewsAssignment
//
//  Created by Abhishek Kumar on 12/11/20.
//

import Foundation

struct MostPopularNewsModel: Codable {
    var results: [NewsModel]?
}

struct NewsModel: Codable {
    let url: String
    let source: String
    let publishedDate: String
    let byLine: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case url
        case source
        case publishedDate = "published_date"
        case byLine = "byline"
        case title
    }
}
