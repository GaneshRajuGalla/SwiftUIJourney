//
//  ContentView.swift
//  AnimationsSample
//
//  Created by Ganesh on 14/11/23.
//

import SwiftUI

struct AnimationsSample: View {
    
    // MARK: - Properties
    @State private var offsetX:CGFloat = -((UIScreen.main.bounds.width - 80)/2)
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [._0F0C29,._302B63,._24243E], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                
                // bouncy
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .bouncy)
                textView(animation: .bouncy)
                
                // default
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .default)
                textView(animation: .default)
                
                
                // easeIn
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .easeIn)
                textView(animation: .easeIn)
               
                
                // easeInOut
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .easeInOut)
                textView(animation: .easeInOut)
               
                
                // easeOut
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .easeOut)
                textView(animation: .easeOut)
               
                
                // interpolatingSpring
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .interpolatingSpring(stiffness: 100, damping: 10))
                textView(animation: .interpolatingSpring)
                
                
                // interactiveSpring
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .interactiveSpring(response: 1,dampingFraction: 0.3,blendDuration: 1.25))
                textView(animation: .interactiveSpring)
                
                // linear
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .linear)
                textView(animation: .liner)
                
                // smooth
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .smooth)
                textView(animation: .smooth)
                
                // snappy
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .snappy)
                textView(animation: .snappy)
                
                // spring
                imageView()
                    .withAnimation(offsetX: offsetX, animation: .spring)
                textView(animation: .spring)
               
                Spacer()
                
                Button {
                    if offsetX < 0{
                        offsetX = ((UIScreen.main.bounds.width - 80)/2)
                    }else{
                        offsetX = -((UIScreen.main.bounds.width - 80)/2)
                    }
                } label: {
                    Text("Animate")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding()
                        .background(._0F0C29)
                        .clipShape(Capsule())
                        .foregroundStyle(Color.white)
                }
            }
            .padding()
        }
    }
}

extension AnimationsSample{
    
    // TODO: - ImageView
    private func imageView() -> some View {
        ZStack {
            Circle()
                .fill(
                    RadialGradient(
                        gradient: Gradient(colors: [ Color._24243E, .white]),
                        center: .center,
                        startRadius: 0,
                        endRadius: 30
                    )
                )
                .frame(width: 30, height: 30)
                .shadow(radius: 10)
        }
    }

    
    //TODO: - TextView
    
    private func textView(animation:Animations) -> some View{
        Text(animation.rawValue)
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(.white)
    }
}

#Preview {
    AnimationsSample()
}


struct customAnimation: ViewModifier{
    
    // MARK: - Properties
    var offsetX:CGFloat
    var animation: Animation
    
    
    // MARK: - body
    func body(content: Content) -> some View {
        content
            .offset(x: offsetX)
            .animation(animation, value: offsetX)
    }
}


extension View{
    
    func withAnimation(offsetX:CGFloat,animation:Animation) -> some View{
        self.modifier(customAnimation(offsetX: offsetX, animation: animation))
    }
}

enum Animations: String {
    case bouncy
    case `default`
    case easeIn
    case easeInOut
    case easeOut
    case interpolatingSpring
    case interactiveSpring
    case liner
    case smooth
    case snappy
    case spring
}
