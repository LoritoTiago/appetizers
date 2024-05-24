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
    
    // - Network Alerts
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
    
    
    
    
    // - Account Alert
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                           message:Text("Please ensute all fields in the form have been filled out."),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                           message:Text("Please ensute your email is correct."),
                                           dismissButton: .default(Text("Ok")))
    
    static let userSaveSuccess  = AlertItem(title: Text("Profile saved"),
                                           message:Text("Your profile information was successfull done."),
                                           dismissButton: .default(Text("Ok")))
    
    static let invalidUserData  = AlertItem(title: Text("Profile error"),
                                           message:Text("There was an error saving or retriving your profile"),
                                           dismissButton: .default(Text("Ok")))

}
