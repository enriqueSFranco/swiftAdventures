//
//  IMCView.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/06/24.
//

import SwiftUI

struct IMCView: View {
    enum Gender {
        case male
        case female
    }
    // caña de pescar
    @State private var selectedGender: Gender = .male // Inicialmente seleccionado como hombre
    @State private var height: Double = 160
    @State private var age: Int = 18
    @State private var weight: Int = 60
    // Opción 1 para el color de la StatusBar
    //    init() {
    //        UINavigationBar.appearance()
    //            .titleTextAttributes =
    //        [.foregroundColor: UIColor.white]
    //    }
    
    var body: some View {
        VStack {
            HStack {
                ToggleButton(text: "Hombre", iconName: "heart.fill", gender: .male, selectedGender: $selectedGender)
                ToggleButton(text: "Mujer", iconName: "star.fill", gender: .female, selectedGender: $selectedGender)
            }
            HeightCalculator(selectedHeight: $height)
            HStack {
                CounterButton(text: "Edad", count: $age)
                CounterButton(text: "Peso", count: $weight)
            }
            NavigationStack {
                NavigationLink(destination: {}) {
                    Text("Calcular mi IMC")
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: 100)
                        .background(Color("ComponentColor"))
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
        .background(Color("BackgroundApp"))
        .toolbar { // Opción 2 para el texto del StatusBar
            ToolbarItem(placement: .principal) { // Es una mejor opción
                Text("Calcula tu IMC")
                    .foregroundColor(.white)
            }
        }
    }
}

struct CounterButton: View {
    let text: String
    @Binding var count: Int
    // si se pone el simbolo ´$´ significa que vamos a trabajar y modificar el valor
    // si lo se requiere representarlo se omite el simbolo ´$´
    var body: some View {
        VStack {
            TitleText(text: text)
            IMCTextFiled(text: String(count))
            HStack {
                Button(action: {
                    count = max(0, count - 1)
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Image(systemName: "minus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
                
                Button(action: {
                    count = max(0, count + 1)
                }) {
                    ZStack {
                        Circle()
                            .frame(width: 70, height: 70)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        Image(systemName: "plus")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                    }
                }
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("ComponentColor"))
        .cornerRadius(10)
    }
}

struct HeightCalculator: View {
    @Binding var selectedHeight: Double
    
    var body: some View {
        VStack {
            TitleText(text: "Altura")
            IMCTextFiled(text: "\(Int(selectedHeight))cm")
            Slider(value: $selectedHeight, in: 100...220, step: 1)
                .padding(.horizontal, 16)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("ComponentColor"))
        .cornerRadius(10)
    }
}

struct TitleText: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .foregroundColor(.gray)
    }
}

// componente toggle button
struct ToggleButton: View {
    let text: String
    let iconName: String
    let gender: IMCView.Gender // identificador del botón para el genero
    @Binding var selectedGender: IMCView.Gender // anzuelo

    var body: some View {
        let isSelected = gender == selectedGender
        let buttonColorGender = isSelected ? Color("ActiveColor") : Color("ComponentColor")
        
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
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity) // ajusta proporcionalmente los componentes
            .background(buttonColorGender)
            .cornerRadius(10)
        }
        .buttonStyle(PlainButtonStyle()) // Eliminar el estilo predeterminado del botón
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
