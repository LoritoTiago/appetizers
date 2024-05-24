//
//  AppetizerListCell.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct AppetizerListCell: View {
    let apptizer: Appetizer
    
    var body: some View{
        HStack(spacing: 10){
            AppetizerRemoteImage(urlString: apptizer.imageURL).aspectRatio(contentMode: .fit)
                .frame(width: 120, height: 90).cornerRadius(10.0)
            VStack(alignment: .leading){
                Text("\(apptizer.name)").font(.title2).fontWeight(.medium)
                Text("$\(apptizer.price,specifier: "%.2f")").font(.title2).foregroundColor(.secondary).fontWeight(.semibold)
            }.padding(.leading)

        }
    }
}

#Preview {
    AppetizerListCell(apptizer: MockData.sampleAppetizer)
}
