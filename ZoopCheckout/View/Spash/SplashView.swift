//
//  SplashView.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 13/12/20.
//

import SwiftUI

struct SplashView: View {
    private static let ACTIVATION_DELAY: Int = 2
    @State var isActive: Bool = false
    
    var body: some View {
        ZStack {
            if (isActive) {
                HomeView();
            } else {
                Color("Primary").edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                ZoopLogo()
                    .animation(.easeIn)
            }
        }
        .onAppear {
            startDelayedActivation()
        }
    }
    
    private func startDelayedActivation() {
        let deadline = DispatchTime.now()
                       + DispatchTimeInterval.seconds(Self.ACTIVATION_DELAY)
        DispatchQueue.main.asyncAfter(deadline: deadline) {
            setActivation()
        }
    }
    
    private func setActivation() {
        withAnimation {
            isActive = true
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
            .previewDevice("iPhone 11 Pro")
    }
}
