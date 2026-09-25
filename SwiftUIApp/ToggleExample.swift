//
//  ToggleExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

struct ToggleExample: View {
    
    @State var bike: Bool = false
    @State var car: Bool = false
    @State var train: Bool = false
    
    @State var toggle: Bool = false
    
    var body: some View {
      
        VStack {
            Text("Preferred mode of travel")
                .font(.title)
                .bold()
            
            HStack {
                Toggle("Bike", isOn: $bike)
                Toggle("Car", isOn: $car)
                Toggle("Train", isOn: $train)
            }
            .toggleStyle(.button)
            
            Button("Save") {
                
            }
            .buttonStyle(.glassProminent)
        }
        .padding()
        
//        VStack{
//            Text("Settings")
//                .font(.largeTitle)
//                .bold()
//            
//            Toggle("Enable Labs", isOn: $toggle)
//                .padding()
//            
//            Button("Apply Changes") {
//                
//            }.disabled(!toggle)
//        }
    }
}

#Preview {
    ToggleExample()
}
