//
//  AccountViewModel.swift
//  appetizers
//
//  Created by Lorito Mbuta on 21/05/2024.
//

import SwiftUI

final class AccountViewModel: ObservableObject{
    @Published var user = User()
    @Published var alertItem: AlertItem?
    
    //Persiste data to local storage
    @AppStorage("user") private var userData: Data?
    
    
    
    func saveChanges(){
        guard isValidForm else { return }
        
        
        
        // save data to local storage
        do{
            
            let data = try JSONEncoder().encode(user)
            userData = data
            
            
            alertItem = AlertContext.userSaveSuccess
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    func retriveUser(){
        
        //get data from local storage
        guard let userData  else { return }
        
        do {
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.invalidUserData
        }
    }
    
    
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail else {
            
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
        
        
    }
    
    
}
