//
//  TextViewExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/23/26.
//

import SwiftUI

struct TextViewExample: View {
    var body: some View {
        Text("Hello, I am learning SwiftUI for a project that involves AR and VR capabilities provided by the visionOS.")
            .font(.largeTitle)
            .foregroundStyle(.orange)
            .frame(width: 180)
            .lineSpacing(15)
            .multilineTextAlignment(.center)
        
        Text(Date()...Date().addingTimeInterval(100))
        
        Text(Date(), style: .timer)
            .font(.largeTitle)
    }
}

#Preview {
    TextViewExample()
}
