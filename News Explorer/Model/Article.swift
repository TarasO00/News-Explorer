//
//  Article.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation

struct Article {
    let source: Source
    let author: String?
    let title: String
    let description: String
    let url: URL
    let urlToImage: URL?
    let publishedAt: Date
    let content: String
}
