//
//  SignInView.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 14/12/20.
//

import SwiftUI

struct SignInView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: SignInViewModel
    
    init(viewModel: SignInViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Qual é o seu usuário?"),
                         footer: Text(viewModel.usernameError).foregroundColor(.red)) {
                    TextField("user", text: $viewModel.username)
                }
                Section (header: Text("Qual é a sua senha?")) {
                    SecureField("Senha", text: $viewModel.password)
                }
                Section {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack (alignment: .center) {
                            Text("Entrar")
                        }
                    }
                }
            }
        }
        .navigationTitle("Sign In")
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView(viewModel: SignInViewModel())
    }
}
