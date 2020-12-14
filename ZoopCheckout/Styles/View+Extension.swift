//
//  View+Extension.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 13/12/20.
//

import Foundation
import SwiftUI

extension View {
    func fillWidth() -> some View {
        return self.frame(minWidth: 0, maxWidth: .infinity)
    }
    
    func fillHeight() -> some View {
        return self.frame(minHeight: 0, maxHeight: .infinity)
    }
    
    func fullFill() -> some View {
        let _ = self.fillWidth()
        let _ = self.fillHeight()
        return self
    }
}
