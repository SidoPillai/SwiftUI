//
//  ColorPickerExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

struct ColorPickerExample: View {
    
    @State var colorPicked: Color = Color.black
    
    var body: some View {
        
        VStack {
            RoundedRectangle(cornerRadius: 16)
                .fill(colorPicked)
                .overlay {
                    Text("The color")
                        .font(.custom("Chalkduster", size: 24))
                        .foregroundColor(.white)
                }
                .frame(height: 200)

            ColorPicker("Color Picker", selection: $colorPicked, supportsOpacity: false)
                .labelsHidden()
                .frame(width: 100, height: 100)
        }.padding()
    }
}

#Preview {
    ColorPickerExample()
}
