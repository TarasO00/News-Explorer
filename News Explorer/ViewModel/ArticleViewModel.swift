//
//  ArticleViewModel.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation
import SwiftUI

extension ContentView {
    @MainActor class ViewModel: ObservableObject {
        @Published var articleList = [Article]()
        
        init() {
            fetchArticles()
            fetchArticles()
        }
        
        func fetchArticles() {
            articleList.append(Article.exampleArticle)
        }
    }
}
