//
//  shouhi2.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/30.
//

import SwiftUI

func namedrink() -> String{
    var name:String = ""
    
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].use){
            name = drinkArray[item].name
        }
    }
    
    return name
}

func Redrink() -> Void{
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].use){
            drinkArray[item].use = false
        }
    }
}

func newdrink(use:Int) -> Int{
    var newnum:Int = 0
    
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].use){
            let num = drinkArray[item].numbers
            newnum = num - use
            drinkArray[item].numbers = newnum
        }
    }
    
    return newnum
}

struct shouhi2: View {
    @Environment(\.dismiss) var dismiss
    @State var num:Int = 1
    @State var isPresented:Bool = false
    @State var no:Bool = false
    @State var name:String = ""
    @State var newnum:Int = 0

    var body: some View {
        ZStack{
            Color.blue.ignoresSafeArea()
            VStack{
                Text("消費する個数を入力してください")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                HStack{
                    Button(action: {
                        if(num > 1){
                            num -= 1
                        }
                    }){
                        Text("-")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(width:100,height: 100,alignment: .center)
                            .background(Color.white)
                            .cornerRadius(15,antialiased: true)
                    }
                    .padding()
                    Text("\(num)")
                        .font(.system(size: 100, weight: .bold, design: .default))
                        .foregroundColor(Color.white)
                        .frame(width:200,height: 200,alignment: .center)
                        .background(Color.blue)
                        .padding()
                    Button(action: { num += 1}){
                        Text("+")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color.black)
                            .frame(width:100,height: 100,alignment: .center)
                            .foregroundColor(Color.black)
                            .background(Color.white)
                            .cornerRadius(15,antialiased: true)
                    }
                    .padding()
                    
                }
                HStack{
                    Button(action:{ num = 1 }){
                        VStack{
                            Text("Delete")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(15,antialiased: true)
                        
                    }
                    .padding()
                    Button(action:{
                        name = namedrink()
                        no.toggle()
                    }){
                        VStack{
                            Text("OK")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.black)
                        .background(Color.white)
                        .cornerRadius(15,antialiased: true)
                        
                    }.alert(isPresented: $no){
                        Alert(title:Text("\(name)を\(num)杯消費しますか？"),
                              primaryButton: .destructive(Text("OK"), action:{
                            newnum = newdrink(use: num)
                            if(newnum <= 5){
                                shouhimessage(name: name, num: newnum)
                            }
                            Redrink()
                            saveDrinkmarks(drinkArray: drinkArray)
                            var transaction = Transaction()
                            transaction.disablesAnimations = true
                            withTransaction(transaction) {
                                isPresented = true
                            }
                        }),
                              secondaryButton: .cancel(Text("キャンセル"),action: {}))
                    }
                    .padding()
                }
                .navigationBarBackButtonHidden(true)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(action: {
                            Redrink()
                            dismiss()
                        }) {
                            HStack {
                                Image(systemName: "arrowshape.turn.up.backward.fill")
                                    .font(.system(size: 50, weight: .medium))
                            }
                            .foregroundColor(.white)
                        }
                    }
                }
            }
            
        }.fullScreenCover(isPresented: $isPresented) {
            kanryou()
        }
    }
}

struct shouhi2_Previews: PreviewProvider {
    static var previews: some View {
        shouhi2()
    }
}
