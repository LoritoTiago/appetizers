//
//  appetizersApp.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

@main
struct appetizersApp: App {
    
    var order = Order()
    var body: some Scene {
        WindowGroup {
            
            // User environment
            AppetizerTabView().environmentObject(order)
        }
    }
}
