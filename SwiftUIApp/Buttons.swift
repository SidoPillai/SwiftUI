//
//  Buttons.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/24/26.
//

import SwiftUI

struct Buttons: View {
    
    @State private var counter: Int = 0
    
    var body: some View {
        
        NavigationStack {
            VStack {
                Text("Button was tapped \(counter) times.")
                
                Button(role: .destructive, action: increament, label:  {
                    VStack {
                        Image(systemName: "arrowtriangle.up.fill")
                        Text("Tap to increase")
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.orange, in: .rect(cornerRadius: 5))
                })
                .buttonStyle(.bordered)
                .controlSize(.small)
                
                Button(role: .cancel, action: decreament, label:  {
                    VStack {
                        Image(systemName: "arrowtriangle.down.fill")
                        Text("Tap to decrease")
                    }
                    .padding()
                    .foregroundStyle(.white)
                    .background(Color.red, in: .rect(cornerRadius: 5))
                })
                .buttonStyle(.bordered)
//                .controlSize(.mini)
                .buttonBorderShape(.circle)
                .tint(.mint)
                .disabled(true)
            }
            .navigationTitle("Buttons")
        }
    }
    
    private func increament() {
        counter += 1
    }
    
    private func decreament() {
        counter -= 1
    }
}

#Preview {
    Buttons()
}
