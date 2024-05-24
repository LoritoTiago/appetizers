//
//  AppetizerListViewModel.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import Foundation
final class AppetizerListViewModel: ObservableObject{
    
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    func getAppetizers(){
        isLoading=true
        NetworkManager.shared.getAppetizers{ result in
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result{
                case .success(let apptizers):

                    self.appetizers = apptizers
                case .failure(let error):
                   
                    print("\(error.localizedDescription)")
                    switch error{
                    case .invalidResponse:
                        self.alertItem =  AlertContext.invalidResponse
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .UnableToComplete:
                        self.alertItem = AlertContext.unableToComplete
                        
                    }
                    
                }
            }
           
            
        }
    }
}
