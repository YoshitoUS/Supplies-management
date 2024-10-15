//
//  zaikoview.swift
//  playful
//
//  Created by Yoshito Usui on 2023/02/01.
//

import SwiftUI

struct zaikoview: View {
    var drink:DrinkData
    
    var body: some View{
        HStack{
            Text(drink.name + " : 在庫" + String(drink.numbers))
            Spacer()
        }
    }
}

struct zaikoview_Previews: PreviewProvider {
    static var previews: some View {
        zaikoview(drink: drinkArray[0])
            .previewLayout(.sizeThatFits)
    }
}
