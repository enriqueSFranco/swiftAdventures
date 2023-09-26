//
//  StacksViews.swift
//  Hello_World
//
//  Created by Enrique SFranco on 21/09/23.
//

import SwiftUI

/*
    Color(red: 0, green: 0, blue: 0)
    Color.primary, secondary <- estos colores tomar el color que tenga en ese mometo el dispositivo
 */

struct StacksViews: View {
    @State private var showingAlet = false
    
    var body: some View {
//        LAS STACK AYUDAN A AGRUPAR VISTAS
        
//        ================= STACK VERTICAL =================
//        VStack(alignment: .leading) {
//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//            Text("Bye World")
//            Spacer() // empuja el contenido hace arriba
//        }
//
//        ================= STACK HORIZONTA L=================
//        HStack() {
//            Text("enrique sfranco")
//            Text("ios developer")
//            Spacer() // empuja el contenido hace la izquierda
//        }
        

//        ================= STACK EN Z =================
//        ZStack {
//            VStack(spacing: 0) {
//                Color(.red)
//                Color(.blue)
//            }
//
//            Text("hello world")
//                .foregroundColor(.secondary)
//                .padding(50)
//                .background(.ultraThinMaterial)
//        }
        
//       ================= CUADRICULA 3X3 =================
//        VStack {
//            HStack {
//                Text("1")
//                Text("2")
//                Text("3")
//            }
//            HStack {
//                Text("4")
//                Text("5")
//                Text("6")
//            }
//            HStack {
//                Text("7")
//                Text("8")
//                Text("9")
//            }
//        }
        
//      ================= GRADIENTES =================
//        ZStack {
//            usando shorcut para el gradient
//            LinearGradient(gradient: Gradient(stops: [
//                .init(color: .white, location: 0.45), // <- shorcut .init
//                .init(color: .black, location: 0.55)
//            ]), startPoint: .top, endPoint: .bottom)
//            LinearGradient(gradient: Gradient(stops: [
//                Gradient.Stop(color: .white, location: 0.45),
//                Gradient.Stop(color: .black, location: 0.55)
//            ]), startPoint: .top, endPoint: .bottom)
//            LinearGradient(colors: [.white, .black], startPoint: .bottom, endPoint: .topLeading)
        
        //    ================= BUTTONS Y ALERTAS =================
        VStack {
            Button("button 1") {
            }
            .buttonStyle(.bordered)
            
            Button("button 2", role: .destructive) {
                
            }
            .buttonStyle(.bordered)
            
            Button("button 3") {
                
            }
            .buttonStyle(.borderedProminent) // el borderedProminent solo se debe usar una o maximo 2 veces para destacar los botones, si se usa mas de dos veces ya hay un problema porque ya no seria destacable el contenido
            
            Button("Sing In") {
                showingAlet = true
            } .alert("Important message", isPresented: $showingAlet) {
                Button("Delete", role: .destructive) {}
                Button("Cancel", role: .cancel) {}
            } message: {
                Text("Please read this")
            }
        }
    }
    
    func signIn () {
        print("iniciando sesion")
    }
    
}

struct StacksViews_Previews: PreviewProvider {
    static var previews: some View {
        StacksViews()
    }
}
