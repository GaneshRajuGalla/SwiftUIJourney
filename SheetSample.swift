//
//  SheetSample.swift
//  Sheet
//
//  Created by Ganesh on 29/10/23.
//

import SwiftUI

struct SheetSample: View {
    
    // MARK: - Properties
    @State private var isPresented:Bool = false
    
    // MARK: - Body
    var body: some View {
        Button{
            isPresented.toggle()
        }label: {
            Text("Present")
                .font(.headline)
                .fontWeight(.bold)
        }
        
        .sheet(isPresented: $isPresented){
            ContentView()
            
            // Keeping a SwiftUI Sheet Open
                //.interactiveDismissDisabled()
            
            // Customizing Sheet Height
                //.presentationDetents([.medium])
            
            // Make Corners Round
                //.presentationCornerRadius(50)
            
            // Customize background
                //.presentationBackground(Material.ultraThinMaterial)
            
            // Display gray bar at top
                //.presentationDragIndicator(.visible)
            
            // Display method of sheet
               // .presentationCompactAdaptation(.sheet)
            
            // Prioritize Sheet
                .presentationDetents([.medium,.large])
            
            // Prioritize Sheet resizing
               // .presentationContentInteraction(.resizes)
            
            // Prioritize scrolling
                .presentationContentInteraction(.scrolls)
            
        }
    }
}

struct ContentView: View {
    // MARK: - Properties
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        Button {
            dismiss()
        } label: {
            Text("Dismiss")
                .font(.headline)
                .fontWeight(.bold)
        }
    }
}

#Preview {
    SheetSample()
}
