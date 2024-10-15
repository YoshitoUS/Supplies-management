//
//  drink.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/29.
//

import Foundation

struct DrinkData: Equatable,Codable{
    var id = UUID()
    var del:Bool
    var use:Bool
    var numbers:Int
    var name:String
}

func saveDrinkmarks(drinkArray: [DrinkData]) {
    let jsonEncoder = JSONEncoder()
    
    guard let data = try? jsonEncoder.encode(drinkArray) else {
        return
    }
    UserDefaults.standard.set(data, forKey: "drinkArray")
}

func loadDrinkmarks() -> [DrinkData]? {
    let jsonDecoder = JSONDecoder()
    guard let data = UserDefaults.standard.data(forKey: "drinkArray"),
          let drinkArray = try? jsonDecoder.decode([DrinkData].self, from: data) else {
        return nil
    }
    
    return drinkArray
}

var drinkArray: [DrinkData] = [
    DrinkData(del:false,use:false,numbers:10, name:"ミルクティ"),
    DrinkData(del:false,use:false,numbers:10, name:"味噌汁"),
    //DrinkData(del:false,use:false,numbers:20, name:"カフェオレ"),
    //DrinkData(del:false,use:false,numbers:10, name:"ミルクティ"),
    //DrinkData(del:false,use:false,numbers:10, name:"ミルクティ"),
    DrinkData(del:false,use:false,numbers:20, name:"カフェオレ")
]

