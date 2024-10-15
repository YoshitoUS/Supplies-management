//
//  hozyuu2.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/31.
//

import SwiftUI

func hozyuudrink(hozyuu:Int) -> Int{
    var newnum:Int = 0
    
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].use){
            let num = drinkArray[item].numbers
            newnum = num + hozyuu
            drinkArray[item].numbers = newnum
        }
    }
    
    return newnum
}

struct hozyuu2: View {
    @FocusState var isInputActive: Bool
    @Environment(\.dismiss) var dismiss
    @State var kosu:String = ""
    @State var isPresented:Bool = false
    @State var no:Bool = false
    @State var name:String = ""
    @State var num:Int = 0
    @State var newnum:Int = 0
    
    var body: some View {
        ZStack{
            Color.pink.ignoresSafeArea()
            VStack{
                Text("補充する個数を入力してください")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                HStack{
                    Text("個数：").padding(.horizontal,0)
                        .font(.system(size: 50, weight: .bold, design: .default))
                    TextField("0",text: $kosu)
                        .font(.system(size: 50))
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.numberPad)
                        .frame(width: 100,height: 100)
                        .fontWeight(.bold)
                        .focused($isInputActive)
                }
                HStack{
                    Button(action:{ kosu = "" }){
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
                        if(Int(kosu) != nil){
                            name = namedrink()
                            num = Int(kosu)!
                            no.toggle()
                        }
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
                        Alert(title:Text("\(name)を\(num)杯補充しますか？"),
                              primaryButton: .destructive(Text("OK"), action:{
                            newnum = hozyuudrink(hozyuu: num)
                            hozyuumessage(name: name, num: newnum)
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
            }
        }
        .toolbar{
            ToolbarItemGroup(placement: .keyboard){
                Spacer()
                Button("Done"){
                    isInputActive = false
                }
            }
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
        }.fullScreenCover(isPresented: $isPresented) {
            kanryou()
        }
    }
}

struct hozyuu2_Previews: PreviewProvider {
    static var previews: some View {
        hozyuu2()
    }
}
