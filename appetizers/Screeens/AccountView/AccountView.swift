//
//  AccountView.swift
//  appetizers
//
//  Created by Lorito Mbuta on 20/05/2024.
//

import SwiftUI

struct AccountView: View {
    

    
    @StateObject private var viewModel  = AccountViewModel()
    @FocusState private var focusedTextField: FormTextField?
    
    enum FormTextField{
        case firstName, lastName, email
    }
    
    var body: some View {
        NavigationView{
            
            Form{
                
                Section(header:Text("Personal Info")){
                    TextField("First Name", text: $viewModel.user.firstName)
                        .focused($focusedTextField,equals: .firstName)
                        .onSubmit { focusedTextField = .lastName }
                        .submitLabel(.next)
                    
                    
                    TextField("Last Name", text: $viewModel.user.lastName)
                        .focused($focusedTextField, equals: .lastName)
                        .onSubmit() { focusedTextField = .email }
                        .submitLabel(.next)
                    
                    
                    TextField("Email", text:  $viewModel.user.email)
                        .focused($focusedTextField, equals: .email)
                        .onSubmit { focusedTextField = nil }
                        .submitLabel(.continue)
                    
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
               
            }
            .navigationTitle("🤣 Account")
            .toolbar{
                ToolbarItemGroup(placement: .keyboard){
                    Button{
                        focusedTextField = nil
                    }label: {
                        Text("Dismiss")
                    }
                }
            }
            
            
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
