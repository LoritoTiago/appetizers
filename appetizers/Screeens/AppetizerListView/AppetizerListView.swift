//
//  AppetizerListView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct AppetizerListView: View {
    

    
    @StateObject var viewModel = AppetizerListViewModel();
    
    
    
    var body: some View {
        
        ZStack{
            NavigationView{
                List(viewModel.appetizers){appetizer in

                    AppetizerListCell(apptizer:appetizer )
                    
                }.navigationTitle("🍟 Appetizers")
                
            }
            .onAppear{
                viewModel.getAppetizers()
            }
            
            
            if viewModel.isLoading{
                NavigationView{
                    LoadingView().navigationTitle("🍟 Appetizers")
                }
             
            }
            
        }
        .alert(item:$viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.dismissButton)
        }
        
    }
    
    
    
}

#Preview {
    AppetizerListView()
}


