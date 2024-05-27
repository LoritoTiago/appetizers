//
//  AppetizerListViewModel.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import Foundation
@MainActor final class AppetizerListViewModel: ObservableObject{
    
    @Published  var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false
    
    
    @Published  var isShowingDetail = false
    @Published  var selectedAppetizer: Appetizer?
    
    //    func getAppetizers(){
    //        isLoading=true
    //        NetworkManager.shared.getAppetizers{ result in
    //            DispatchQueue.main.async {
    //                self.isLoading = false
    //
    //                switch result{
    //                case .success(let apptizers):
    //
    //                    self.appetizers = apptizers
    //                case .failure(let error):
    //
    //                    print("\(error.localizedDescription)")
    //                    switch error{
    //                    case .invalidResponse:
    //                        self.alertItem =  AlertContext.invalidResponse
    //
    //                    case .invalidURL:
    //                        self.alertItem = AlertContext.invalidURL
    //
    //                    case .invalidData:
    //                        self.alertItem = AlertContext.invalidData
    //
    //                    case .UnableToComplete:
    //                        self.alertItem = AlertContext.unableToComplete
    //
    //                    }
    //
    //                }
    //            }
    //
    //
    //        }
    //    }
    
    
    func getAppetizers(){
        isLoading=true
        Task{
            do{
                appetizers = try await   NetworkManager.shared.getAppetizers()
                isLoading = false
            }catch{
                if let appError = error as? APError{
                    switch appError{
                    case .invalidResponse:
                        alertItem =  AlertContext.invalidResponse
                        
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .UnableToComplete:
                        alertItem = AlertContext.unableToComplete
                    }
                }else{

                    // generic error
                    alertItem = AlertContext.genericError
                }
                
                isLoading = false
                
            }
        }
    }
}
