//
//  SearchView.swift
//  News Explorer
//
//  Created by  User on 28.07.2023.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject private var vm: ArticleViewModel
    
    @State private var query = ""
    @State private var dateFrom = Date()
    @State private var dateTo = Date()
    @State private var selection = "Relevancy"
    let sortBy = ["Relevancy", "Popularity", "Published at"]
    
    @State private var showingAlert = false
    
    @Environment(\.dismiss) private var dismiss
    
    init(vm: ArticleViewModel) {
        self.vm = vm
    }
    
    var body: some View {
        List {
            TextField("Seach query", text: $query)
                    .textFieldStyle(.roundedBorder)
            DatePicker("From", selection: $dateFrom, displayedComponents: .date)
            DatePicker("To", selection: $dateTo, displayedComponents: .date)
            Picker("Sort by", selection: $selection) {
                ForEach(sortBy, id: \.self) {
                    Text($0)
                }
            }
            Button {
                if query.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    showingAlert = true
                } else {
                    vm.fetchArticles(query: query, dateFrom: dateFrom, dateTo: dateTo, sortBy: selection)
                    dismiss()
                }
            } label: {
                Text("Search")
                .frame(maxWidth: .infinity, alignment: .center)
            }
            .alert("Warning", isPresented: $showingAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text("Search query can not be empty")
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(vm: ArticleViewModel())
    }
}
