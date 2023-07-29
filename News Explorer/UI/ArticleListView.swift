//
//  ArticleListView.swift
//  News Explorer
//
//  Created by  User on 29.07.2023.
//

import SwiftUI

struct ArticleListView: View {
    @ObservedObject private var vm: ArticleViewModel
    
    init(vm: ArticleViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        VStack {
            if vm.articleList.count == 0 {
                Text("No articles to show. Please use search to load new articles.")
                    .frame(width: 200)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
            } else {
                List(vm.articleList) {
                    article in NavigationLink(destination: DetailView(article: article)) {
                        ArticleCellView(article: article)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .background(.clear)
                            .foregroundStyle(CustomColors.wheat)
                            .padding(7)
                    )
                }
                .listStyle(.plain)
                .id(vm.articleList[0].title)
                .refreshable {
                    vm.refresh()
                }
                
                HStack {
                    if vm.currentPage > 1 {
                        Button {
                            vm.prevPage()
                        } label: {
                            Image(systemName: "chevron.left")
                        }
                    }
                    Text("Page \(vm.currentPage)")
                    if vm.currentPage < vm.numPages {
                        Button {
                            vm.nextPage()
                        } label: {
                            Image(systemName: "chevron.right")
                        }
                    }
                }
            }
        }
        .navigationTitle("Articles")
        .toolbar {
            NavigationLink(destination: SearchView(vm: vm)) {
                Image(systemName: "magnifyingglass")
            }
        }
    }
}

struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView(vm: ArticleViewModel())
    }
}
