//
//  BaseTextField.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/06/24.
//

import SwiftUI

struct BaseTextField: View {
    // creando un estado
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        VStack {
            if #available(iOS 17.0, *) {
                TextField("Enter your email", text: $email)
                    .keyboardType(.emailAddress)
                    .padding(16)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal, 32)
                    .onChange(of: email) { oldValue, newValue in
                        print("el antiguo valor era \(oldValue) y el  nuevo valor es \(newValue)")
                    }
                SecureField("Enter your password", text: $password)
                    .padding(16)
                    .background(.gray.opacity(0.1))
                    .cornerRadius(16)
                    .padding(.horizontal, 32)
                    .onChange(of: password) { oldValue, newValue in
                        print("el antiguo valor era \(oldValue) y el  nuevo valor es \(newValue)")
                    }
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

#Preview {
    BaseTextField()
}
