//
//  OrderView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    
    
    var body: some View {
        NavigationView{
            
            ZStack{
                VStack{
                    List{
                        ForEach(order.items){ appetizer in
                            AppetizerListCell(apptizer: appetizer)
                            
                        }
                        .onDelete(perform:order.deleteItem)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button{
                        print("Order Placed")
                    }label: {
                        
                        Text( "$\(order.totalPrice,specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                }
                
                if order.items.isEmpty{
                    EmptyState(title: "You have no items in your order", imageName: "empty-order")
                }
            }
            .navigationTitle("🧾 Orders")
            
        }
        
        
        
    }
    
    
}

#Preview {
    OrderView()
}
