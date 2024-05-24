//
//  ContentView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct AppetizerTabView: View {
    @EnvironmentObject var order: Order
    
    var body: some View {
        
     
        
        
        TabView{
            AppetizerListView().tabItem {
//                Image(systemName: "house")
//                Text("Home")
                Label("Home", systemImage: "house")
            }
            AccountView().tabItem {
                Label("Account", systemImage:"person")
            }
            OrderView().tabItem {
                Label("Order",systemImage: "bag")
            }.badge(order.items.count)
        }
    }
}

#Preview {
    AppetizerTabView()
}
