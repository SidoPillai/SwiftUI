//
//  3DCardExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

struct AnimationCardExample: View {
    
    @State var valueTransition: CGSize = CGSize.zero
    @State var isDragging: Bool = false
    
    var body: some View {
        ZStack {
            Image(.castle)
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 417)
                .overlay {
                    Rectangle()
                        .fill(.black)
                        .frame(width: 300, height: 50)
                        .colorInvert()
                        .blur(radius: 100)
                        .offset(x: -valueTransition.width/1.5, y: -valueTransition.height/1.5)
                }
                .clipped()
            
            Image(.ios)
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 200)
                .offset(y: 20)
                .offset(x: valueTransition.width/30, y: valueTransition.height/30)
        }
        .frame(width: 1000, height: 1000)
        .background(.black)
        .rotation3DEffect(.degrees(isDragging ? 10: 0), axis: (x: valueTransition.height, y: valueTransition.width, z: 0.0))
        .gesture(
            DragGesture()
                .onChanged({ value in
                    valueTransition = value.translation
                    isDragging = true
                })
                .onEnded({ value in
                    valueTransition = .zero
                    isDragging = false
                })
        )
//        .rotationEffect(.degrees(isDragging ? 10: 0), axis:())
    }
}

#Preview {
    AnimationCardExample()
}
