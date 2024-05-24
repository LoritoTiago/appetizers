//
//  EmptyState.swift
//  appetizers
//
//  Created by Lorito Mbuta on 24/05/2024.
//

import SwiftUI

struct EmptyState: View {
    
    let title: String
    
    let imageName: String
    var body: some View {
        ZStack{
            Color(.systemBackground)
                .ignoresSafeArea()
            
            VStack{
                Image(imageName)
                    .resizable()
                    .scaledToFit()
                    .frame( height: 150)
                
                Text(title)
                    .font(.title3)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .padding()
            }
            .offset(y:-50 )
        }
    }
}

#Preview {
    EmptyState(title: "This is our test message. \nI'm making it a little long for testing.",imageName: "empty-order")
}
