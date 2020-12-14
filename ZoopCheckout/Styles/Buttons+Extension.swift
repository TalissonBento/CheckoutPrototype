//
//  Buttons.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 13/12/20.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
            configuration
                .label
                .padding(Buttons.PADDING)
                .font(.custom("Roboto-Regular", size: 22))
                .foregroundColor(configuration.isPressed
                                    ? Color("White")
                                    : Color("Primary"))
                .background(
                    RoundedRectangle(
                        cornerRadius: Buttons.ROUND_RADIUS,
                        style: .continuous)
                        .fill(configuration.isPressed
                                ? Color("Primary")
                                : Color("White"))	
                )
    }
}

extension Button {
    func primary() -> some View {
        return self.buttonStyle(PrimaryButtonStyle())
    }    
}
