//
//  ContentView.swift
//  ViewAppearance
//
//  Created by Ganesh on 07/10/23.
//

import SwiftUI

struct ViewAppearance: View {
    
    // MARK: - Properties
    @State private var isGray:Bool = false
    
    // MARK: - Body
    
    var body: some View {
        ZStack{
//            if isGray{
//                Color(.gray)
//                    .ignoresSafeArea()
//            }else {
//                Color(.black)
//                    .ignoresSafeArea()
//            }
            Color(isGray ? .gray : .black)
                .ignoresSafeArea()
            
            Button(String.changeColor) {
                isGray.toggle()
            }
            .modifier(CustomButton(backGroundColot: .orange))
            .padding()
        }
    }
}

#Preview {
    ViewAppearance()
}


// MARK: - ViewModifier

struct CustomButton: ViewModifier{
    let backGroundColot:Color
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .frame(maxWidth: .infinity)
            .background(backGroundColot, in: Capsule())
    }
}


// MARK: - String

extension String{
    static let changeColor = "Change Color"
}
