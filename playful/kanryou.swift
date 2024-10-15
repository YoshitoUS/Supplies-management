//
//  kanryou.swift
//  playful
//
//  Created by Yoshito Usui on 2023/02/10.
//

import SwiftUI
import UIKit

struct ParticlesEffect : GeometryEffect {
    
    var time: Double
    var speed: Double = .random(in: 10...100)
    var direction: Double = .random(in: -Double.pi ... Double.pi)
    
    var animatableData: Double {
        get { return time }
        set { time = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let translationX = cos(direction) * speed * time
        let translationY = sin(direction) * speed * time
        let translation = CGAffineTransform(translationX: translationX, y: translationY)
        return ProjectionTransform(translation)
    }
    
}

struct ParticlesModifier: ViewModifier {
    
    @State var time = 0.0
    @State var scale = 0.1
    var duration = 5.0
    var particlesCount: Int = 100
    
    func body(content: Content) -> some View {
        
        ZStack {
            ForEach(0..<particlesCount, id: \.self) { _ in
                content
                    .scaleEffect(scale)
                    .opacity((duration - time) / duration)
                    .modifier(ParticlesEffect(time: time))
            }
        }
        .onAppear {
            withAnimation (.easeOut(duration: duration)) {
                self.time = duration
                self.scale = 1.0
            }
        }
        
    }
    
}


struct kanryou: View {
    @State private var isPresented:Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                Text("完了").padding(.horizontal,0)
                    .font(.system(size: 70, weight: .bold, design: .default))
                
                Image(systemName: "hand.thumbsup.fill")
                    .resizable()
                    .frame(width: 80,height: 80)
                
                Circle()
                    .fill(Color.blue)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: -20, y : -100)
                
                Circle()
                    .fill(Color.red)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: -10, y : -100)
                
                Circle()
                    .fill(Color.green)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 0, y : -100)
                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 10, y : -100)
                
                Circle()
                    .fill(Color.purple)
                    .frame(width: 12, height: 12)
                    .modifier(ParticlesModifier())
                    .offset(x: 20, y : -100)
            }
            .foregroundColor(Color.orange)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    var transaction = Transaction()
                    transaction.disablesAnimations = true
                    withTransaction(transaction) {
                        isPresented = true
                    }
                }
            }
        }.fullScreenCover(isPresented:  $isPresented) {
            ContentView()
        }
    }
}

struct kanryou_Previews: PreviewProvider {
    static var previews: some View {
        kanryou()
    }
}
