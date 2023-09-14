//
//  SuperHeroDetail.swift
//  Hello_World
//
//  Created by Enrique SFranco on 12/09/23.
//

import SwiftUI

struct SuperHeroDetail: View {
    @EnvironmentObject private var model: ModelData
    let superHero: SuperHero
    
    var superHeroIdx: Int {
        model.superHeroes.firstIndex(where: {$0.id == superHero.id})!
    }
    
    var body: some View {
        VStack {
            CircleImage(nameImage: superHero.imageName)
            Divider()
            FavoriteButton(isSet: $model.superHeroes[superHeroIdx].isFavorite)
            Text(superHero.description)
        }
    }
}

struct SuperHeroDetail_Previews: PreviewProvider {
    static let data = ModelData()
    
    static var previews: some View {
        ForEach (["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            SuperHeroDetail(superHero: data.superHeroes[0])
                .environmentObject(data)
                .previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}
