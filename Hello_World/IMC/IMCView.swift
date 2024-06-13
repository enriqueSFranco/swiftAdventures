//
//  IMCView.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/06/24.
//

import SwiftUI

struct IMCView: View {
    @State var gender = 0
    // Opción 1 para el color de la StatusBar
    //    init() {
    //        UINavigationBar.appearance()
    //            .titleTextAttributes =
    //        [.foregroundColor: UIColor.white]
    //    }
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Hombre", iconName: "heart.fill", gender: 0, selectedGender: $gender)
                ToggleButton(text: "Mujer", iconName: "star.fill", gender: 1, selectedGender: $gender)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BackgroundApp"))
        .toolbar { // Opción 2 para el texto del StatusBar
            ToolbarItem(placement: .principal) { // Es una mejor opción
                Text("Calcula tu IMC")
                    .foregroundColor(.white)
            }
        }
    }
}

// componente toggle button
struct ToggleButton: View {
    let text: String
    let iconName: String
    let gender: Int
    @Binding var selectedGender: Int
    

    var body: some View {
        let buttonColorGender = if gender == selectedGender {
            Color("ActiveColor")
        } else {
            Color("ComponentColor")
        }
        
        Button(action: {
            selectedGender = gender
        }) {
            VStack {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .foregroundColor(.white)
                IMCTextFiled(text: text)
            }
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            .background(buttonColorGender)
        }
    }
}

struct IMCTextFiled: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .bold()
            .foregroundColor(.white)
    }
}

#Preview {
    IMCView()
}
