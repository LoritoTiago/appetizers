//
//  Alert.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import Foundation
import SwiftUI


struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
    
}

struct AlertContext{
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message:Text("The data received from the server was invalid"),
                                       dismissButton: .default(Text("Ok")))
    
    static let invalidResponse = AlertItem(title: Text("Invalid Response"),
                                          message:Text("Invalid response from the server, please try again later or contact suport."),
                                          dismissButton: .default(Text("Ok")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                     message:Text("There was an issue connecting to the server"),
                                     dismissButton: .default(Text("Ok")))
    
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                           message:Text("Unable to complete your request at this time"),
                                           dismissButton: .default(Text("Ok")))
}
