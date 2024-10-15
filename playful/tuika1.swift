//
//  tuika1.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/31.
//

import SwiftUI

struct tuika1: View {
    @Environment(\.dismiss) var dismiss
    @State var tuika_num:String = ""
    @State var tuika_name:String = ""
    @FocusState var isTuikaActive: Bool
    @State private var isPresented: Bool = false
    @State var no:Bool = false
    
    var body: some View {
        ZStack{
            Color.yellow.ignoresSafeArea()
            VStack{
                Text("新規登録する品名、個数を入力してください")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding()
                VStack{
                    HStack{
                        Text("品名：").padding(.horizontal,0)
                            .font(.system(size: 50, weight: .bold, design: .default))
                        TextField("例)ミルクティ",text: $tuika_name)
                            .font(.system(size: 50))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.default)
                            .frame(width: 350,height: 100)
                            .fontWeight(.bold)
                            .focused($isTuikaActive)
                    }
                    HStack{
                        Text("個数：").padding(.horizontal,0)
                            .font(.system(size: 50, weight: .bold, design: .default))
                        TextField("0",text: $tuika_num)
                            .font(.system(size: 50))
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .keyboardType(.numberPad)
                            .frame(width: 100,height: 100)
                            .fontWeight(.bold)
                            .focused($isTuikaActive)
                    }
                }
                HStack{
                    Button(action:{ tuika_num = ""; tuika_name = ""}){
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
                        if(tuika_name != "" && tuika_num != ""){
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
                        Alert(title:Text("品名、個数に\n間違いはありませんか？"),
                              primaryButton: .destructive(Text("OK"), action:{
                            if(Int(tuika_num) != nil){
                                let num = Int(tuika_num)
                                tuikamessage(name: tuika_name, num: num!)
                                drinkArray.append(DrinkData(del:false,use:false,numbers:num!, name:tuika_name))
                                saveDrinkmarks(drinkArray: drinkArray)
                                var transaction = Transaction()
                                transaction.disablesAnimations = true
                                withTransaction(transaction) {
                                    isPresented = true
                                }
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
                    isTuikaActive = false
                }
            }
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
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

struct tuika1_Previews: PreviewProvider {
    static var previews: some View {
        tuika1()
    }
}
