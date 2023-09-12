//
//  SuperHeroDetail.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/09/23.
//

import SwiftUI

struct SuperHeroDetail: View {
    let superHero: SuperHero
    
    var body: some View {
        VStack {
            CircleImage(nameImage: superHero.imageName)
            Divider()
            Text(superHero.description)
            
        }
    }
}

struct SuperHeroDetail_Previews: PreviewProvider {
    static var previews: some View {
        ForEach (["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            SuperHeroDetail(superHero: dataSuperHeroes[0])
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
