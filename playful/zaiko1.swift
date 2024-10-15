//
//  zaiko1.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/29.
//

import SwiftUI

struct zaiko1: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            List(drinkArray.indices, id:\.self){ item in
               zaikoview(drink:drinkArray[item])
            }
            .scrollContentBackground(.hidden)
            .background(Color.green)
            .navigationTitle("在庫リスト")
            .navigationBarBackButtonHidden(true)
            .toolbar {      
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        HStack {
                            Image(systemName: "arrowshape.turn.up.backward.fill")
                                .font(.system(size: 45, weight: .medium))
                        }
                        .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct zaiko1_Previews: PreviewProvider {
    static var previews: some View {
        zaiko1()
    }
}


