//
//  AccountView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct AccountView: View {
    

    
    @StateObject private var viewModel  = AccountViewModel()
    
    var body: some View {
        NavigationView{
            
            Form{
                
                Section(header:Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.lastName)
                    TextField("Email", text:  $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    DatePicker("Birthday", selection: $viewModel.user.birthday, displayedComponents: .date)
                        .accentColor(Color.brandPrimaryC)
                    
                    Button{
                        viewModel.saveChanges()
                    }label: {
                        Text("Save Changes")
                    }
                    
                    
                }
                
                Section(header: Text("Requests")){
                    Toggle("Extra Napkins", isOn: $viewModel.user.extraNapKins)
                        
                    Toggle("Frequent Refills", isOn: $viewModel.user.frequentRefills)
                       
                }
                .toggleStyle(SwitchToggleStyle(tint: .brandPrimaryC))
               
            }.navigationTitle("🤣 Account")
            
            
        }
        .onAppear{
            viewModel.retriveUser()
        }
        .alert(item: $viewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,message: alertItem.message, dismissButton: alertItem.dismissButton)
            
        }
    }
}

#Preview {
    AccountView()
}
