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
    
    
    
    // we use _ to unamed parament
    func add(_ appetizer: Appetizer){
        items.append(appetizer)
    }

    
}


