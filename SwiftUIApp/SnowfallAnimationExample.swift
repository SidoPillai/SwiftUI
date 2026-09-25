//
//  SnowfallAnimationExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI

struct Snowflake: Identifiable {
    let id = UUID()
    var x: Double
    var y: Double
    var speed: Double
    var scale: Double
}

struct SnowfallViewAnimation: View {
    
    @State var snowflakes: [Snowflake] = []
    @State var timer: Timer?
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .indigo]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            Canvas { context, size in
                for snowflake in snowflakes {
                    context.draw(
                        Text("❄️")
                            .font(.system(size: 10 * snowflake.scale)),
                        at: CGPoint(x: snowflake.x * size.width, y: snowflake.y * size.height)
                    )
                }
            }
            .ignoresSafeArea()
            
            Text("Snowfall")
                .font(.custom("Noteworthy", size: 72))
                .bold()
                .foregroundStyle(.white)
        }
        .onAppear() {
            startSnowFall()
        }
        .onDisappear() {
            timer?.invalidate()
        }
    }
    
    func startSnowFall(){
        for _ in 0..<50 {
            snowflakes.append(
                Snowflake(
                    x: Double.random(in: 0...1),
                    y: Double.random(in: -0.2...0),
                    speed: Double.random(in: 0.001...0.003),
                    scale: Double.random(in: 0.5...1.5)
                )
            )
        }
        
        timer = Timer.scheduledTimer(
            withTimeInterval: 0.016,
            repeats: true
        ) { _ in
            for i in snowflakes.indices {
                snowflakes[i].y += snowflakes[i].speed
                
                if (snowflakes[i].y > 1.2) {
                    snowflakes[i].y = -0.2
                    snowflakes[i].x = Double.random(in: 0...1)
                }
            }
        }
    }
}

struct SnowfallAnimationExample: View {
    
    var body: some View {
        SnowfallViewAnimation()
    }
}

#Preview {
    SnowfallAnimationExample()
}
