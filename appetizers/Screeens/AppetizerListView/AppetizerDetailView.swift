//
//  AppetizerDetailView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 21/05/2024.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer: Appetizer
    @Binding var isShowingDetail:Bool
    
    // get data from environment object
    @EnvironmentObject var order: Order
    
    var body: some View {
        VStack{
            AppetizerRemoteImage(urlString: appetizer.imageURL).aspectRatio(contentMode: .fill).frame(width: 320, height: 225)
            
            VStack{
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                
                
                HStack(spacing: 40){
                    NutritionInfo(title: "Calories", value: appetizer.calories)
                    
                    NutritionInfo(title: "Carbs", value: appetizer.carbs)
                    
                    NutritionInfo(title: "Protein", value: appetizer.protein)
                    

                }
            }
            Spacer()
            
            Button{
                order.add(appetizer)
                isShowingDetail = false
            }label: {
               //APButton(title: "$\(appetizer.price, specifier: "%.2f") - Add to Order")
                Text("$\(appetizer.price, specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            
//            this is extension
//            .standardButtonStyle()
            .padding(.bottom, 30)
            
            
        }
            .frame(width: 320, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(
                Button{
                    isShowingDetail = false
                }label: {
                    XDismissButton()
            },alignment: .topTrailing)
    }
}

#Preview {
    AppetizerDetailView(appetizer:MockData.sampleAppetizer,isShowingDetail:.constant(true))
}


struct NutritionInfo: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 5){
            Text(title)
                .font(.caption)
                .bold()
                
            Text("\(value)")
                .foregroundColor(.secondary)
                .fontWeight(.semibold)
        }
    }
}
