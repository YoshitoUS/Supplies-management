//
//  hozyuu1.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/29.
//

import SwiftUI

struct hozyuuview: View {
    @State var drink:DrinkData
    @Binding var isNavigate:Bool
    
    var body: some View {
        Button(action:{
            let index = drinkArray.firstIndex(of: drink)!
            //drink.use.toggle()
            drinkArray[index].use = true//drink.use
           // drink.use.toggle()
            isNavigate.toggle()
        }){
            Text(drink.name)
                .font(.title)
                .fontWeight(.bold)
                .frame(width:150,height: 100,alignment: .center)
                .foregroundColor(Color.black)
                .background(Color.white)
                .cornerRadius(15,antialiased: true)
        }
        .padding()
    }
}

struct hozyuu1: View {
    @Environment(\.dismiss) var dismiss
    @State var isNavigate:Bool = false
    
    var body: some View {
        ZStack{
            NavigationStack{
                ZStack{
                    Color.pink.ignoresSafeArea()
                    VStack{
                        Text("補充する飲み物を選択してください")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.white)
                        if(drinkArray.count < 6){
                            HStack{
                                ForEach(0 ..< drinkArray.count ,id: \.self){ item in
                                    hozyuuview(drink: drinkArray[item],isNavigate: $isNavigate)
                                }
                            }.navigationDestination(isPresented: $isNavigate){
                                hozyuu2()
                            }
                        }else{
                            ScrollView(.horizontal){
                                LazyHStack( ){
                                    ForEach(0 ..< drinkArray.count ,id: \.self){ item in
                                        hozyuuview(drink: drinkArray[item],isNavigate: $isNavigate)
                                    }
                                }.navigationDestination(isPresented: $isNavigate){
                                    hozyuu2()
                                }
                            }
                            .frame(height: 150)
                        }
                    }
                }.toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            dismiss()
                            Redrink()
                        }) {
                            HStack {
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                    .font(.system(size: 50, weight: .medium))
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
            } .navigationBarBackButtonHidden(true)
                .navigationViewStyle(.stack)
        }
    }
}

struct hozyuu1_Previews: PreviewProvider {
    static var previews: some View {
        hozyuu1()
    }
}

