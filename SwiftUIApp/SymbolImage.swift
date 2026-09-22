//
//  Images.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/22/26.
//

import SwiftUI

struct SymbolImage: View {
    @State private var sliderValue: Double = 0.0
    
    var body: some View {
        VStack
        {
            Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                .resizable()
                .scaledToFit()
                .padding()
                .symbolRenderingMode(.multicolor)

            Image(systemName: "square.and.arrow.up.trianglebadge.exclamationmark")
                .resizable()
                .scaledToFit()
                .padding()
                .symbolRenderingMode(.palette)
                .foregroundStyle(.indigo, .brown)

            Image(systemName: "heart.circle.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundStyle(.red)
                .font(.system(size: 100))
            
            Image(systemName: "wifi", variableValue: sliderValue)
                .resizable()
                .scaledToFit()
                .padding()
                .symbolRenderingMode(.palette)
            
            Slider(value: $sliderValue, in: 0...1).padding()
        }
        .padding()
    }
}


#Preview {
    SymbolImage()
}
