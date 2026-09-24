//
//  LazyVGridExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/23/26.
//

import SwiftUI

struct LazyVGridExample: View {
//    let cols = [GridItem(.adaptive(minimum: 50))]
    let cols = [GridItem(.fixed(50)), GridItem(.fixed(50))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: cols) {
                ForEach(0...100, id: \.self) { idx in
                    Image(systemName: "\(idx).circle.fill")
                        .font(.largeTitle)
                }
            }
        }
    }
}

#Preview {
    LazyVGridExample()
}
