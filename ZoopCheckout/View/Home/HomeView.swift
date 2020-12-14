//
//  HomeView.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 13/12/20.
//

import SwiftUI

struct HomeView: View {
    @State var showLoginModal: Bool = false
    
    @ObservedObject var signInViewModel = SignInViewModel()
    
    var body: some View {
        ZStack {
            Image("customer-making-payment")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Rectangle()
                .fill(Color("Primary"))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                .opacity(0.5)
                .blendMode(.hardLight)
            VStack (spacing: 50) {
                ZoopLogo()
                    .frame(maxWidth: .infinity,
                           alignment: .leading)
                Text(Texts.SLOGAN)
                    .font(.custom("Roboto-Light", size: 32))
                    .foregroundColor(Color("White"))
                    .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                Spacer()
                Button (action: {
                    showLoginModal.toggle()
                }) {
                    HStack{
                        Spacer()
                            Text("ENTRAR")
                        Spacer()
                    }
                }
                .primary()
                .sheet(isPresented: $showLoginModal) {
                    SignInView(viewModel: signInViewModel)
                }
                .accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            }
            .frame(minWidth:0, maxWidth: .infinity,
                   minHeight: 0, maxHeight: .infinity)
            .padding()
        }
        .colorScheme(.light)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
