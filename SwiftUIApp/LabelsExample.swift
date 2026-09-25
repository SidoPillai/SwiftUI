//
//  LabelsExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

// Tip: Use labels especially in list for seemless integration
// Dont create custom HStack

struct LabelsExample: View {
    var body: some View {
//        Label("Hello, world!", systemImage: "star.fill")
        
//        Label("Hello", image: .image1)
        
//        Label {
//            Text("Hello")
//                .font(.title)
//                .bold()
//        } icon: {
//            Image(.image1)
//                .resizable()
//                .frame(width: 48, height: 48)
//                .clipped()
//                .scaledToFit()
//                .clipShape(.circle)
//        }
//        .labelStyle(.titleAndIcon)
//        .labelStyle(.titleOnly)
//        .labelStyle(CustomLabelStyle(iconColor: .red, titleColor: .blue, backgroundColor: .yellow))
        
        
        // alignment issues arise if we remove the divider
//        List {
//            Text("Hello List")
//                .font(.largeTitle)
//
//            HStack {
//                Image(systemName: "person.circle")
//                Divider()
//                Text("Introduction to SwiftUI")
//            }
//            
//            HStack {
//                Image(systemName: "envelope")
//                Divider()
//                Text("Swift Expert")
//            }
//            
//            HStack {
//                Image(systemName: "calendar")
//                Divider()
//                Text("iOS App Development")
//            }
//        }
        
        List {
            Text("Hello List")
                .font(.largeTitle)
            
            Label {
                Text("Item 1")
            } icon: {
                Image(systemName: "person.circle")
                    .foregroundStyle(.primary)
            }
            
            Label {
                Text("Item 2")
            } icon: {
                Image(systemName: "person.circle")
                    .foregroundStyle(.primary)
            }
            
            Label {
                Text("Item 3")
            } icon: {
                Image(systemName: "person.circle")
                    .foregroundStyle(.primary)
            }
        }
    }
}

struct CustomLabelStyle: LabelStyle {
    let iconColor: Color
    let titleColor: Color
    let backgroundColor: Color
    
    func makeBody(configuration: Configuration) -> some View {
        HStack(alignment: .center) {
            configuration.icon
                .foregroundStyle(iconColor.gradient)
            
            configuration.title
                .foregroundStyle(titleColor.gradient)
                .font(.title2)
                
            configuration.icon
                .foregroundStyle(iconColor.gradient)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).fill(backgroundColor.opacity(0.2)))
                    
    }
}

#Preview {
    LabelsExample()
}
