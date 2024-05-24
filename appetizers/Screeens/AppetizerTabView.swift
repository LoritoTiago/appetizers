//
//  ContentView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    
    
    var body: some View {
        TabView{
            AppetizerListView().tabItem {
                Image(systemName: "house")
                Text("Home")
            }
            AccountView().tabItem {
                Image(systemName: "person")
                Text("Account")
            }
            OrderView().tabItem {
                Image(systemName: "bag")
                Text("Order")
            }
        }
        .accentColor(.brandPrimaryC)
    }
}

#Preview {
    AppetizerTabView()
}
