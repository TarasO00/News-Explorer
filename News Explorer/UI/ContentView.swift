import SwiftUI

struct ContentView: View {
    @StateObject private var vm = ArticleViewModel()
    
    var body: some View {
        NavigationView {
            List(vm.articleList) {
                item in NavigationLink(destination: DetailView(article: item)) {
                    VStack {
                        Text(item.title)
                        .bold()
                        .font(.title3)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        Spacer()
                        Text(item.description)
                    }
                    .padding([.top, .bottom])
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
            .navigationTitle("Articles")
            .toolbar {
                NavigationLink(destination: SearchView(vm: vm)) {
                    Image(systemName: "magnifyingglass")
                }
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
