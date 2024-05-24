//
//  CustomMotifiers.swift
//  appetizers
//
//  Created by Lorito Mbuta on 24/05/2024.
//

import SwiftUI

struct StandardButtonStyle: ViewModifier{
    func body(content: Content) -> some View {
        content 
            .buttonStyle(.bordered)
            .tint(.brandPrimary)
            .controlSize(.large)
    }
}


extension View{
    func standardButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
}
