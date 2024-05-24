//
//  Order.swift
//  appetizers
//
//  Created by Lorito Mbuta on 24/05/2024.
//

import SwiftUI



// Using environment (many onbject can acess)
final class Order: ObservableObject{
    @Published var  items: [Appetizer] = []
    
    var totalPrice: Double {
        // add all items
        items.reduce(0){$0 + $1.price }
    }
    
    
    
    // we use _ to unamed parament
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }
    
    func deleteItem(atoffesets: IndexSet){
        items.remove(atOffsets: atoffesets)
    }
    
    


    
}


