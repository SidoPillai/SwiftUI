//
//  LazyHGridExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/23/26.
//

import SwiftUI

struct LazyHGridExample: View {
//    let rows = [GridItem(.adaptive(minimum: 300))]
//    let rows = [GridItem(.flexible()), GridItem(.flexible())]
    let rows = [
        GridItem(.fixed(20)),
        GridItem(.adaptive(minimum: 50, maximum: 100)),
        GridItem(.flexible())
    ]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows) {
                ForEach(0...100, id: \.self) { idx in
                    Image(systemName: "\(idx).circle.fill")
                        .font(.largeTitle)
                }
            }
        }
    }
}

#Preview {
    LazyHGridExample()
}
