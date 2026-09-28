//
//  PhaseAnimation.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/27/26.
//

import SwiftUI

struct PhaseAnimation: View {
    
    // Example 4
    
    let photoCollection: [ImageResource] = [.image1, .image2, .image3, .image4, .castle]
    
    @State var animate = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                PhaseAnimator(photoCollection, trigger: animate) { photoRes in
                    Image(photoRes)
                        .resizable()
                        .scaledToFill()
                        .ignoresSafeArea()
                } animation: { _ in
                    Animation.snappy
                }
                .onTapGesture {
                    animate.toggle()
                }
                
                Text("Swift UI")
                    .font(.largeTitle)
                    .frame(width: 300, height: 200)
                    .background(.ultraThinMaterial)
                    .clipShape(.rect(topLeadingRadius: 100, bottomTrailingRadius: 100))
            }
            .preferredColorScheme(.dark)
        }
    }
    
    // Example 3
//    @State var animate = false
//    
//    var someArray = ["s", "o", "m", "e", "a", "r", "r", "a", "y"]
//    
//    var body: some View {
//        NavigationStack {
//            PhaseAnimator(someArray, trigger: animate) { char in
//                ZStack {
//                    Circle()
//                        .fill(.orange.gradient.opacity(0.5))
//                        .frame(width: 200)
//                    
//                    Image(systemName: char.lowercased())
//                        .symbolVariant(.circle)
//                        .font(.system(size: 200))
//                        .foregroundStyle(.indigo.gradient)
//                }
//            } animation: { char in
//                switch char{
//                case "s": .bouncy.speed(0.2)
//                case "0": .easeIn.speed(0.1)
//                case "m": .easeInOut.speed(0.3)
//                case "e": .easeOut.speed(0.8)
//                case "a": .spring.speed(0.4)
//                case "r": .snappy.speed(0.2)
//                case "y": .smooth.speed(0.1)
//                default: .bouncy.speed(0.3)
//                }
//            }
//            .onTapGesture {
//                animate.toggle()
//            }
//        }
//    }
    
    // Example 2
//    var body: some View {
//        NavigationStack {
//            VStack(spacing: 0) {
//                Image(systemName: "clock.fill")
//                    .resizable()
//                    .foregroundStyle(.orange.gradient)
//                    .frame(width: 200, height: 200)
//                
//                VStack(spacing: 0) {
//                    Rectangle()
//                        .frame(width: 1, height: 150)
//                    
//                    Circle()
//                        .fill(.brown.gradient)
//                        .frame(height: 20)
//                }
//                .phaseAnimator([45.0, -45.0]) {
//                    view, phase in
//                    view.rotationEffect(.degrees(phase), anchor: .top)
//                } animation: { phase in
////                        .easeInOut.speed(0.2)
//                    switch phase {
//                    case -45.0:
//                        return .snappy
//                    default:
//                        return
//                            .spring(dampingFraction: 0.1)
//                    }
//                    
//                }
//            }
//            .padding(25)
//            .background(.indigo.gradient, in: RoundedRectangle(cornerRadius: 16).stroke(lineWidth: 4))
//            .navigationTitle("Phase Animator")
//        }
//    }
    
//    Example 1
//    @State var animate = false
//    
//    var body: some View {
//        NavigationStack {
//            VStack {
//                Circle()
//                    .fill(.red.gradient)
//                
//                Circle()
//                    .fill(.green.gradient)
//
//                Circle()
//                    .fill(.blue.gradient)
//            }
//            .scaleEffect(animate ? 1.0 : 0.5)
//            .navigationTitle("Phase Animation")
//            .onTapGesture {
//                // This only changes the scale but doesn't animate use with phaseanimator
//                animate.toggle()
//                
//                // with animation key does the animation lock
////                withAnimation {
////                    animate.toggle()
////                }
//            }
//            .phaseAnimator([1.0, 0.5], trigger: animate) { view, phase in
//                view
//                    .scaleEffect(phase)
//                    .opacity(phase)
//            }
//        }
//    }
}

#Preview {
    PhaseAnimation()
}
