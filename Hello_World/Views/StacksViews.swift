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
//    @State private var showingAlet = false
    @State private var scoreTitle = ""
    @State private var showingScore = false
    
    @State private var countries: [String] = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()

    @State private var correctAnswer = Int.random(in: 0...2)
    
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
//        VStack {
//            Button("button 1") {
//            }
//            .buttonStyle(.bordered)
//
//            Button("button 2", role: .destructive) {
//
//            }
//            .buttonStyle(.bordered)
//
//            Button("button 3") {
//
//            }
//            .buttonStyle(.borderedProminent) // el borderedProminent solo se debe usar una o maximo 2 veces para destacar los botones, si se usa mas de dos veces ya hay un problema porque ya no seria destacable el contenido
//
//            Button("Sing In") {
//                showingAlet = true
//            } .alert("Important message", isPresented: $showingAlet) {
//                Button("Delete", role: .destructive) {}
//                Button("Cancel", role: .cancel) {}
//            } message: {
//                Text("Please read this")
//            }
//        }
        
//        ================= EJERCICIO =================
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
            ], center: .top, startRadius: 200, endRadius: 600)
                .ignoresSafeArea()
            VStack(spacing: 15) {
                VStack {
                    Text("Tap the flag up")
                        .foregroundColor(.white)
                        .font(.subheadline.weight(.heavy))
                    Text(countries[correctAnswer])
                        .foregroundColor(.white)
                        .font(.largeTitle.weight(.semibold))
                }

                VStack(spacing: 20) {
                    ForEach(0..<3) { flag in
                        Button {
                            flagTapped(flag)
                        } label: {
                            FlagImage(flag: countries[flag])
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            .alert(scoreTitle, isPresented: $showingScore) {
                Button("Continue", action: askQuestion)
            } message: {
                Text("your score is \(scoreTitle)")
            }
            .padding()
        }
    }
    
    func flagTapped (_ idx: Int) {
        if idx == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    
    func askQuestion () {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct FlagImage: View {
    var flag: String

    var body: some View {
        Image(flag)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
    }
}

struct StacksViews_Previews: PreviewProvider {
    static var previews: some View {
        StacksViews()
    }
}
