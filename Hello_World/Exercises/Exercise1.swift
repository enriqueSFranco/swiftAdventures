//
//  Exercise1.swift
//  Hello_World
//
//  Created by Enrique SFranco on 11/06/24.
//

import SwiftUI

struct Exercise1: View {
   
    var body: some View {
        VStack {
            HStack {
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
                    
            }
            .frame(height: 100)
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Circle()
                Rectangle()
                Circle()
            }
            Rectangle()
                .foregroundColor(.orange)
                .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
            HStack {
                Rectangle()
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                Rectangle()
                    .foregroundColor(.orange)
                Rectangle()
                    .foregroundColor(.yellow)
                    
            }
            .frame(height: 100)
        }
        .background(.red)
    }
}

#Preview {
    Exercise1()
}
