//
//  shoukyo1.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/29.
//

import SwiftUI

func check_drink() -> Bool{
    var check:Bool = false
    
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].del){
            check = true
        }
    }
    
    return check
}

func arraysakuzyo() -> Array<String>{
    var name:[String] = []
    
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].del){
            name.append(drinkArray[item].name)
        }
    }
    return name
}

func sakuyodrink() -> Void{
    var count:Int = 0
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item - count].del){
            drinkArray.remove(at: item - count)
            count += 1
        }
    }
}

struct sakuzyoview: View{
    @State var drink:DrinkData

    var body: some View {
        Button(action:{
            let index = drinkArray.firstIndex(of: drink)!
            
            drink.del.toggle()
            drinkArray[index].del = drink.del
        }){
            Text(drink.name)
                .frame(width:150,height: 100,alignment: .center)
                .background(drink.del ? .blue : .white)
            
        }
        .font(.title)
        .fontWeight(.bold)
        .foregroundColor(Color.black)
        .cornerRadius(15,antialiased: true)
        .padding(.horizontal)
    }
    
}

func sakuzyoRedrink() -> Void{
    for item in 0 ..< drinkArray.count{
        if(drinkArray[item].del){
            drinkArray[item].del = false
        }
    }
}

struct sakuzyo1: View {
    @Environment(\.dismiss) var dismiss
    @State private var isPresented: Bool = false
    @State var no:Bool = false
    @State var name:[String] = []
    
    var body: some View {
        ZStack{
            Color.purple.ignoresSafeArea()
            VStack(){
                Text("削除する飲み物を全て選択してください")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding([.leading])
                if(drinkArray.count < 6){
                    HStack{
                        ForEach(0 ..< drinkArray.count ,id: \.self){ item in
                            sakuzyoview(drink: drinkArray[item])
                        }
                    }
                }else{
                    ScrollView(.horizontal){
                        LazyHStack(){
                            ForEach(0 ..< drinkArray.count ,id: \.self){ item in
                                sakuzyoview(drink: drinkArray[item])
                            }
                        }
                    }
                    .frame(height: 150)
                }
                HStack{
                    Button(action:{
                        if(check_drink()){
                            no.toggle()
                        }
                    }){
                        VStack{
                            Text("Delete")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.black)
                        .cornerRadius(15,antialiased: true)
                        
                    }.alert(isPresented: $no){
                        Alert(title:Text("削除する飲み物に\n間違いはありませんか？"),
                              primaryButton: .destructive(Text("OK"), action:{
                            name = arraysakuzyo()
                            sakuzyomessage(name: name)
                            sakuyodrink()
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
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        sakuzyoRedrink()
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
        }.fullScreenCover(isPresented: $isPresented) {
            kanryou()
        }
    }
}

struct sakuzyo1_Previews: PreviewProvider {
    static var previews: some View {
        sakuzyo1()
    }
}



