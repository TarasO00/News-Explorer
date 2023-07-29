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
    
    private var prevUrl = ""
    private(set) var numPages = 0
    private(set) var currentPage = 1
    
    func fetchArticles(query: String, dateFrom: Date, dateTo: Date, sortBy: String) {
        var url = baseUrl + "?apiKey=\(apiKey)&q=\(query)&"
        url += "from=\(dateFrom.ISO8601Format())&to=\(dateTo.ISO8601Format())&"
        if(sortBy != "Published at") {
            url += "sortBy=\(sortBy.lowercased())"
        }
        sendRequest(url: url) { [weak self] response in
            guard let self = self else { return }
            
            self.articleList = response.articles
            self.numPages = Int(ceil(Double(response.totalResults)/100))
        }
        prevUrl = url
    }
    
    func refresh() {
        sendRequest(url: prevUrl) { [weak self] response in
            guard let self = self else { return }
            self.articleList = response.articles
        }
    }
    
    func nextPage() {
        
    }
    
    func sendRequest(url: String, action: @escaping (ApiResponse) -> ()) {
        apiManager.getData(url: url, model: ApiResponse.self) { result in
                    
                    DispatchQueue.main.async {
                        switch(result) {
                            case .success(let response):
                                action(response)
                            case .failure(let error):
                                print(error)
                        }
                    }
        }
    }
}
