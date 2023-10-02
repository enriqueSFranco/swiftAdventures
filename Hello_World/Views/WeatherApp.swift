//
//  WeatherApp.swift
//  Hello_World
//
//  Created by Enrique SFranco on 22/09/23.
//

import SwiftUI

struct WeatherApp: View {
    var body: some View {
        WeatherContent()
    }
}

struct WeatherContent: View {
    @State private var isNight = false

    var body: some View {
        ZStack {
            BackgroundView(colorsArray: isNight ? [.black, .gray] : [.blue, Color("lightBlue")])
            VStack {
                HeaderView()
                Spacer()
                WeatherSummaryView(isNight: $isNight)
                Spacer()
                WeatherDaysList()
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    Text("change time of day")
                        .foregroundColor(.white)
                        .padding()
                        .background(isNight ? .black : .blue)
                        .cornerRadius(10)
                }
                .shadow(color: isNight ? .gray : .blue, radius: 15, y: 5)
                Spacer()
            }
        }
    }
}

struct WeatherSummaryView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180, alignment: .center)
            Text("70°")
                .foregroundColor(.white)
                .font(.system(size: 56, weight: .semibold, design: .default))
        }
    }
}

struct WeatherDaysList: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
//            TODO: Refactor
            HStack(spacing: 20) {
                WeatherDay(
                    day: "mon",
                    degrees: 70,
                    iconWeather: "cloud.sun.fill"
                )
                WeatherDay(
                    day: "tue",
                    degrees: 88,
                    iconWeather: "sun.max.fill"
                )
                WeatherDay(
                    day: "wed",
                    degrees:25,
                    iconWeather: "wind.snow"
                )
                WeatherDay(
                    day: "thu",
                    degrees: 56,
                    iconWeather: "cloud.sun.fill"
                )
                WeatherDay(
                    day: "fri",
                    degrees: 22,
                    iconWeather: "cloud.sun.rain.fill"
                )
                WeatherDay(
                    day: "sat",
                    degrees: 10,
                    iconWeather: "cloud.moon.rain.fill"
                )
                WeatherDay(
                    day: "sun",
                    degrees: 55,
                    iconWeather: "moon.fill"
                )
            }
            .padding()
        }
    }
}

struct HeaderView: View {
    var body: some View {
        Text("ciudad de mexico")
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct BackgroundView: View {
    var colorsArray: [Color]

    var body: some View {
        LinearGradient(gradient: Gradient(colors: colorsArray),
                       startPoint: .topLeading, endPoint: .bottomTrailing)
            .ignoresSafeArea()
    }
}

struct WeatherApp_Previews: PreviewProvider {
    static var previews: some View {
        WeatherApp()
    }
}
