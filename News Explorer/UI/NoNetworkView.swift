//
//  NoNetworkView.swift
//  News Explorer
//
//  Created by  User on 29.07.2023.
//

import SwiftUI

struct NoNetworkView: View {
    var body: some View {
        VStack {
            Image(systemName: "wifi.slash")
                .resizable()
                .scaledToFit()
                .frame(width: 40)
                .foregroundColor(.red)
            Text("Network connection seems to be offline. Please check you connectivity.")
                .frame(width: 200)
                .multilineTextAlignment(.center)
                .foregroundColor(.gray)
        }
    }
}

struct NoNetworkView_Previews: PreviewProvider {
    static var previews: some View {
        NoNetworkView()
    }
}
