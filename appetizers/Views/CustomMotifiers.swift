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





extension Image{
    func customImageModifier() -> some View{
        self
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 120, height: 90)
    }
}


extension View{
    func standardButtonStyle() -> some View{
        self.modifier(StandardButtonStyle())
    }
}
