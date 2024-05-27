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
                        //.listRowSeparator(.hidden)
                        //.listRowSeparatorTint(.brandPrimary)
                        .onTapGesture {
                        viewModel.isShowingDetail = true
                        viewModel.selectedAppetizer = appetizer
                    }
                    
                }
                
                .navigationTitle("🍟 Appetizers")
                .listStyle(.plain)
                    .disabled(viewModel.isShowingDetail)
                
            }
            .task{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20: 0)
            
            if viewModel.isShowingDetail {
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetail:$viewModel.isShowingDetail)
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


