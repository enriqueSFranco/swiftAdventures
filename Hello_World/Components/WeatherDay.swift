//
//  WeatherDay.swift
//  Hello_World
//
//  Created by Enrique SFranco on 22/09/23.
//

import SwiftUI

struct WeatherDay: View {
    var day: String
    var degrees: Int
    var iconWeather: String
    
    var body: some View {
        VStack {
            Text(day)
                .textCase(.uppercase)
            Image(systemName: iconWeather)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .center)
            Text("\(degrees)°")
                .foregroundColor(.black)
                .font(.subheadline.weight(.semibold))
        }
        .padding()
        .background(.regularMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}

struct WeatherDay_Previews: PreviewProvider {
    static var previews: some View {
        WeatherDay(day: "tue", degrees: 70, iconWeather: "cloud.sun.fill")
    }
}
