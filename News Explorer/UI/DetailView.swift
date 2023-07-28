//
//  DetailView.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import SwiftUI

struct DetailView: View {
    let article: Article
    
    var body: some View {
        VStack {
            if let imgUrl = article.urlToImage {
                AsyncImage(
                    url: imgUrl,
                    content: {
                        image in image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(maxWidth: 500)
                    },
                    placeholder:  {
                        ProgressView()
                    })
            }
            VStack(alignment: .leading) {
                Text(article.title)
                    .bold()
                    .font(.title3)
                    .padding(.bottom, 5)
                Text(article.content)
                    .padding(.bottom, 5)
                Divider()
                Text("Author: \(article.author ?? "Unavailable")")
                Text("Source: \(article.source.name)")
                    .padding(.bottom, 5)
                Text("Published at: \(article.publishedAt.formatted(.dateTime.day().month().year()))")
                    .padding(.bottom, 5)
                Link("Read full article at the source", destination: article.url)
                
            }
            .padding([.leading, .trailing], 10)
            Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(article: Article.exampleArticle)
    }
}
