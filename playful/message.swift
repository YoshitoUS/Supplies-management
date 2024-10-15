//
//  message.swift
//  playful
//
//  Created by Yoshito Usui on 2023/02/25.
//

import Foundation
import Alamofire
/*
func message() -> Void{
    let parameters: Parameters = [
        "attachments": [
            [
                "color": "#0081f0",
                "text": "〇〇さんが会員登録を行いました！",
                "fields": [
                    [
                        "title": "日時",
                        "value": String(describing: Date()),
                       // "short": false
                    ],
                    [
                        "title": "名前",
                        "value": "〇〇",
                        "short": true
                    ],
                    [
                        "title": "メールアドレス",
                        "value": "〇〇",
                        "short": true
                    ]
                ]
            ]
        ]
    ]
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    AF.request("https://hooks.slack.com/services/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",
               method: .post,
               parameters: parameters,
               encoding: JSONEncoding.default,
               headers: headers).responseString {
        response in
        switch response.result {
        case .success:
            print("success")
        case .failure:
            message()
        }
    }
}
*/
func shouhimessage(name:String, num:Int) -> Void{
    let parameters: Parameters = [
        "attachments": [
            [
                "color": "#0081f0",
                "text": "残り在庫が少ないです！",
                "fields": [
                    [
                        "title": "品名",
                        "value": name
                    ],
                    [
                        "title": "残り在庫数",
                        "value": "\(num)杯",
                    ]
                ]
            ]
        ]
    ]
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    AF.request("隠してます！",
               method: .post,
               parameters: parameters,
               encoding: JSONEncoding.default,
               headers: headers).responseString {
        response in
        switch response.result {
        case .success:
            print("success")
        case .failure:
            shouhimessage(name: name, num: num)
        }
    }
}

func hozyuumessage(name:String, num:Int) -> Void{
    let parameters: Parameters = [
        "attachments": [
            [
                "color": "#ff0093",
                "text": "補充されました！",
                "fields": [
                    [
                        "title": "品名",
                        "value": name
                    ],
                    [
                        "title": "残り在庫数",
                        "value": "\(num)杯",
                    ]
                ]
            ]
        ]
    ]
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    AF.request("隠してます！",
               method: .post,
               parameters: parameters,
               encoding: JSONEncoding.default,
               headers: headers).responseString {
        response in
        switch response.result {
        case .success:
            print("success")
        case .failure:
            hozyuumessage(name: name, num: num)
        }
    }
}

func sakuzyomessage(name:[String]) -> Void{
    let sepa = name.joined(separator: ",")
    
    let parameters: Parameters = [
        "attachments": [
            [
                "color": "#6d47ab",
                "text": "こちらの飲み物の管理をやめます！",
                "fields": [
                    [
                        "title": "品名",
                        "value": String(sepa)
                    ]
                ]
            ]
        ]
    ]
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    AF.request("隠してます！",
               method: .post,
               parameters: parameters,
               encoding: JSONEncoding.default,
               headers: headers).responseString {
        response in
        switch response.result {
        case .success:
            print("success")
        case .failure:
            sakuzyomessage(name: name)
        }
    }
}

func tuikamessage(name:String, num:Int) -> Void{
    let parameters: Parameters = [
        "attachments": [
            [
                "color": "#fffe00",
                "text": "こちらの飲み物の管理を始めます！",
                "fields": [
                    [
                        "title": "品名",
                        "value": name
                    ],
                    [
                        "title": "在庫数",
                        "value": "\(num)杯",
                    ]
                ]
            ]
        ]
    ]
    let headers: HTTPHeaders = [
        "Content-Type": "application/json"
    ]
    AF.request("隠してます！",
               method: .post,
               parameters: parameters,
               encoding: JSONEncoding.default,
               headers: headers).responseString {
        response in
        switch response.result {
        case .success:
            print("success")
        case .failure:
            tuikamessage(name: name, num: num)
        }
    }
}
