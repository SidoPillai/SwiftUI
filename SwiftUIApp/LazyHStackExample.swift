//
//  LazyHStackExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/23/26.
//

import SwiftUI

struct LazyHStackExample: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0...100, id: \.self) { _ in
                    Text(Date().formatted(date: .omitted, time: .standard))
                        .font(.largeTitle)
                }
            }
        }
    }
}

#Preview {
    LazyHStackExample()
}
