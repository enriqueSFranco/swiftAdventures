//
//  IMCResult.swift
//  Hello_World
//
//  Created by Enrique SFranco on 14/06/24.
//

import SwiftUI

func calculateIMC(weight: Double, height: Double) -> Double? {
    guard weight > 0, height > 0 else {
        return nil
    }
    
    let heightInMeters = height / 100
    let imc = weight / pow(heightInMeters, 2)
    
    return imc
}

func getResult(result: Double) -> (String, String, Color) {
    let tag: String
    let description: String
    let color: Color
    
    switch result {
        case 0.0 ... 19.99:
            tag = "Peso bajo"
            description = "Estás por debajo del peso recomendado."
            color = .red
        case 20.0 ... 24.99:
            tag = "Peso normal"
            description = "Estás en el peso recomendado."
            color = .green
        case 25.0 ... 29.99:
            tag = "Sobrepeso"
            description = "Estás por encima del peso recomendado"
            color = .orange
        case 30.0 ... 100.99:
            tag = "Obesidad"
            description = "Estás muy por encima del peso recomendado"
            color = .red
        default:
            tag = "ERROR"
            description = "Ha ocurrido un error"
            color = Color(.red)
    }
    
    return (tag, description, color)
}

struct IMCResult: View {
    let userHeight: Double
    let userWeight: Double
    
    var body: some View {
        VStack {
            let result = calculateIMC(weight: userWeight, height: userHeight) ?? 0
            Text("Tu resultado")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(.white)
            InformationView(result: result)
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("BackgroundApp"))
    }
}

struct InformationView: View {
    let result: Double
    
    var body: some View {
        let (tag, description, color) = getResult(result: result)
        VStack {
            Spacer()
            Text("\(tag)")
                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(color)
            Spacer()
            Text("\(result, specifier: "%.2f")")
                .font(.system(size: 80))
                .fontWeight(.bold)
                .foregroundColor(.white)
            Spacer()
            Text("\(description)")
                .font(.title2)
                .foregroundColor(.white)
            Spacer()
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        .background(Color("ComponentColor"))
        .cornerRadius(10)
        .padding(10)
    }
}

#Preview {
    IMCResult(userHeight: 170, userWeight: 70)
}
