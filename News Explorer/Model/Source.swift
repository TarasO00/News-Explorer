//
//  Source.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation

struct Source: Decodable {
    let id: String?
    let name: String
    
    static var exampleSource = Source(id: "the-verge", name: "The Verge")
}
