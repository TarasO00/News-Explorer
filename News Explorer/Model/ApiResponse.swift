//
//  ApiResponse.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation

struct ApiReponse: Decodable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
