//
//  AnimationsExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

struct AnimationsExample: View {
    
    @State var flag: Bool = false
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(.green.gradient)
                .frame(width: 200, height: 200)
                .overlay {
                    Text("Hello, Animations!")
                        .foregroundStyle(.white)
                }
                .offset(y: flag ? 400 : 0)
//                .animation(.spring(), value: flag)
//                .animation(.easeIn(duration: 5).delay(5), value: flag)
            
            Spacer()
            
            Button("Toggle") {
//                flag.toggle()
                
//                withAnimation {
//                    flag.toggle()
//                }
                
                // withAnimation lock - gives completion
//                withAnimation(.default) {
//                    flag.toggle()
//                } completion: {
//                    print("Animation completed!")
//                }
                
                withAnimation(.bouncy().speed(0.1).repeatCount(3)) {
                    flag.toggle()
                }
            }
        }
    }
}

#Preview {
    AnimationsExample()
}
