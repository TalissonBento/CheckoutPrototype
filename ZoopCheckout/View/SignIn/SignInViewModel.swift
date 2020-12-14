//
//  UserCredentialModelView.swift
//  ZoopCheckout
//
//  Created by Talisson Bento on 14/12/20.
//

import Foundation
import SwiftUI
import Combine

final class SignInViewModel : ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published private(set) var validation: Validation = .None
    @Published private(set) var usernameError = ""
    @Published private(set) var passwordError = ""
    
    private var cancellableSet = Set<AnyCancellable>()

    init() {
        hasUsernameEnoughLengthPublisher
            .receive(on: RunLoop.main)
            .map { isValid in
                if (isValid) {
                    return .Success
                } else {
                    return .Fail(message: "username very small")
                }
            }
            .assign(to: \.validation, on: self)
            .store(in: &cancellableSet)
        
        isUsernameEmptyPublisher
            .receive(on: RunLoop.main)
            .map { isEmpty in
                if (isEmpty) {
                    return .Fail(message: "username empty")
                } else {
                    return .Success
                }
            }
            .assign(to: \.validation, on: self)
            .store(in: &cancellableSet)
    }
    
    deinit {
        cancellableSet.removeAll()
    }
}

extension SignInViewModel {
    enum Validation {
        case None
        case Success
        case Fail(message: String)
        
        var isSuccess: Bool {
            if case .Success = self {
                return true
            }
            return false
        }
    }
}

// add username validations
extension SignInViewModel {
    private var hasUsernameEnoughLengthPublisher : AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return input.count >= 3
            }
            .dropFirst()
            .eraseToAnyPublisher()
    }
    
    private var isUsernameEmptyPublisher : AnyPublisher<Bool, Never> {
        $username
            .debounce(for: 0.8, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return input.count == 0
            }
            .dropFirst()
            .eraseToAnyPublisher()
    }
}

