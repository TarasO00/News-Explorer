//
//  ArticleViewModel.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import Foundation
import SwiftUI

@MainActor class ArticleViewModel: ObservableObject {
    @Published var articleList = [Article]()
    
    private let apiKey = "03fee78a0ce54fb499d5b815bc1148cb"
    private let baseUrl = "https://newsapi.org/v2/everything"
    private let apiManager = ApiManager()
    
    func fetchArticles(query: String, dateFrom: Date, dateTo: Date, sortBy: String) {
        var url = baseUrl + "?apiKey=\(apiKey)&q=\(query)&"
        url += "from=\(dateFrom.ISO8601Format())&to=\(dateTo.ISO8601Format())&"
        if(sortBy != "Published at") {
            url += "sortBy=\(sortBy.lowercased())"
        }
        sendRequest(url: url)
    }
    
    func sendRequest(url: String) {
        apiManager.getData(url: url, model: ApiReponse.self) { [weak self] result in
                    guard let self = self else { return }
                    
                    DispatchQueue.main.async {
                        switch(result) {
                            case .success(let response):
                                self.articleList = response.articles
                            case .failure(let error):
                                print(error)
                        }
                    }
        }
    }
}
