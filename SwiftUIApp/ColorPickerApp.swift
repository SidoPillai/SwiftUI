//
//  ColorPickerAoo.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/22/26.
//

import SwiftUI

struct ColorPickerApp: View {
    @State private var red: Double = 0.0
    @State private var green: Double = 0.0
    @State private var blue: Double = 0.0
    
    var body: some View {
        VStack {
            ColorView(color: Color(red: red, green: green, blue: blue))
            ColorSliderView(name: "Red", value: $red)
            ColorSliderView(name: "Green", value: $green)
            ColorSliderView(name: "Blue", value: $blue)
        }
    }
}


struct ColorView: View {
    let color: Color
    
    var body: some View {
        RoundedRectangle(cornerRadius: 16)
            .fill(color)
            .border(Color.white)
            .frame(width: 320, height: 200)
            
    }
}

struct ColorSliderView : View {
    let name: String
    @Binding var value: Double
    
    var body: some View {
        HStack(alignment: .center, spacing: 8) {
            Text(name)
                .frame(width: 60, alignment: .leading)
                
            // Color components are expressed in the 0...1 range.
            Slider(value: $value, in: 0...1).frame(width: 200)
            
            Text(value, format: .number.precision(.fractionLength(2)))
        }
        .padding()
    }
}


#Preview {
    ColorPickerApp()
}
