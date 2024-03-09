//
//  FadeAnimationTransition.swift
//  SwiftUIJourney
//
//  Created by Ganesh Raju Galla on 10/03/24.
//

import SwiftUI

struct FadeAnimationTransition: View {
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack{
            Text("Show New Screen")
                .overlayFadeView(isPresented: $isPresented) {
                    Text("Go to Pre - Screen")
                }
                .onTapGesture {
                    isPresented.toggle()
                }
        }
    }
}

#Preview {
    FadeAnimationTransition()
}


extension View {
    
    @ViewBuilder
    func overlayFadeView<OverlayView:View>(isPresented:Binding<Bool>, @ViewBuilder overlay: () -> OverlayView) -> some View {
        ZStack {
            self
            
            if isPresented.wrappedValue {
                VStack {
                    overlay()
                        .transition(.opacity)
                        .zIndex(1)
                }
                .frame(maxWidth: .infinity,maxHeight: .infinity)
                .background(LinearGradient(colors: [Color.pink,Color.yellow], startPoint: .topLeading, endPoint: .bottomTrailing))
            }
        }
    }
}
