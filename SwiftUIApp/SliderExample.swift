//
//  SliderExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

struct SliderExample: View {
    
    @State var amount: Double = 0
    
    var body: some View {
        
        VStack {
            Text("Enter tip amount")
                .font(.headline)
                .bold()
            
            Text("\(amount.formatted(.currency(code: "usd")))")

            Slider(value: $amount, in: 0...100, step: 1)
        }
        .padding()
    }
    
    func onValueChanged() {
        
    }
}

#Preview {
    SliderExample()
}
