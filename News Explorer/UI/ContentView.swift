import SwiftUI

struct ContentView: View {
    @State var networkMonitor = NetworkMonitor()
    @StateObject private var vm = ArticleViewModel()
    
    var body: some View {
        NavigationView {
            if networkMonitor.isConnected {
                ArticleListView(vm: vm)
            } else {
                NoNetworkView()
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
