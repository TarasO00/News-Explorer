//
//  ArticleCellView.swift
//  News Explorer
//
//  Created by  User on 29.07.2023.
//

import SwiftUI

struct ArticleCellView: View {
    let article: Article
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(article.title)
                .bold()
                .font(.title3)
                .padding(.bottom, 5)
            Text(article.description ?? "Description unavailable")
        }
        .padding([.top, .bottom])
    }
}

struct ArticleCellView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleCellView(article: Article.exampleArticle)
    }
}
