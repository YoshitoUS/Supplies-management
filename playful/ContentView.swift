//
//  ContentView.swift
//  playful
//
//  Created by Yoshito Usui on 2023/01/28.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let bounds = UIScreen.main.bounds
        let width = Int(bounds.width)
        let height = Int(bounds.height)
        
        NavigationView{
            VStack{
                ZStack{
                    Text("「新規登録」は管理する飲み物を追加します\n\n 「削除」は選択した飲み物の管理をやめます\n\n#飲み物管理チャンネルで管理状況を報告します")
                        .font(.system(size: 25, weight: .bold, design: .default))
                        .frame(width: 600,height: 300)
                        .border(Color.blue,width: 10)
                        .cornerRadius(10)
                        .position(x: CGFloat(width)-700,y: CGFloat(height)-550)
                    Image("030016")
                        .resizable(resizingMode: .stretch)
                        .aspectRatio(contentMode: .fill)
                        .scaleEffect(0.3)
                        .position(x: CGFloat(width)-200,y: CGFloat(height)-550)
                        .clipped()
                }
                HStack {
                    NavigationLink(destination: hozyuu1()){
                        VStack{
                            Image(systemName: "archivebox.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                            Text("補充")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.pink)
                        .cornerRadius(15,antialiased: true)
                        
                    }
                    .padding()
                    NavigationLink(destination: shouhi1()){
                        VStack{
                            Image(systemName: "mug.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                            Text("消費")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.blue)
                        .cornerRadius(15,antialiased: true)
                        
                    }
                    .padding()
                    NavigationLink(destination: zaiko1()){
                        VStack{
                            Image(systemName: "clipboard.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                            Text("在庫確認")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.green)
                        .cornerRadius(15,antialiased: true)
                    }
                    .padding()
                }
                HStack{
                    NavigationLink(destination: tuika1()){
                        VStack{
                            Image(systemName: "tray.2.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                            Text("新規登録")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.yellow)
                        .cornerRadius(15,antialiased: true)
                        
                    }
                    .padding()
                    NavigationLink(destination: sakuzyo1()){
                        VStack{
                            Image(systemName: "trash.fill")
                                .imageScale(.large)
                                .font(.largeTitle)
                            Text("削除")
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        .frame(width:150,height: 100,alignment: .center)
                        .foregroundColor(Color.white)
                        .background(Color.purple)
                        .cornerRadius(15,antialiased: true)
                    }
                    .padding()
                }
                .padding(.bottom,70)
            }
        }
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews:PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
