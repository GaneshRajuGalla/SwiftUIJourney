//
//  ContentView.swift
//  Sheet
//
//  Created by Ganesh on 24/10/23.
//

import SwiftUI

struct User:Identifiable{
    let id = UUID()
    var name:String
}

struct SheetView: View {
    
    // MARK: - Properties
    //@State private var isPresented:Bool = false
    
    @State private var user:User? = nil
   
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 20){
            Button("User1") {
                user = User(name: "Steave Jobs")
            }
            
            Button("User2"){
                user = User(name: "Tim Cook")
            }
        }
        
//        .sheet(isPresented: $isPresented,onDismiss: {print("Dismissed")}){
//            NextView()
//        }
        .sheet(item: $user){ item in
            NextView(user: item)
        }
    }
}

struct NextView: View {
    
    // MARK: - Properties
    @Environment (\.dismiss) var dismiss
    let user:User
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 30){
            Text("\(user.name)")
                .font(.title)
                .fontWeight(.bold)
            Button("Dismiss") {
                dismiss()
            }
        }
    }
}

extension View{
    func preViewOnDevices() -> some View{
        ForEach(Devices.all, id: \.self){ deviceName in
            previewDevice(PreviewDevice(rawValue: deviceName))
                .previewDisplayName(deviceName)
        }
    }
}

enum Devices:String,CaseIterable{
    case iPhone14 = "iPhone 14"
    case iPhone14ProMax = "iPhone 14 Pro Max"
    
    static var all:[String]{
        return Devices.allCases.map({$0.rawValue})
    }
}


// MARK: - Macro4
#Preview {
    SheetView()
        //.preViewOnDevices()
}

