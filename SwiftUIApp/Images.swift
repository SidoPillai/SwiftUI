//
//  Images.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/22/26.
//

import SwiftUI

struct Images: View {
    var body: some View {
        VStack {
            Image(.image2)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 400)
                .clipShape(.rect(topLeadingRadius: 100, bottomTrailingRadius: 100))
                .overlay {
                    Rectangle()
                        .clipShape(.rect(topLeadingRadius: 100, bottomTrailingRadius: 100))
                        .opacity(0.2)
                }
//                .opacity(0.5)
                .overlay {
                    Text("Tiger")
                        .font(.largeTitle)
                        .bold()
                        .foregroundStyle(.white)
                        .opacity(0.9)
                }
//                .clipShape(.capsule)
//                .aspectRatio(contentMode: .fill)
//                .frame(width: 200)
//                .clipped()
                .ignoresSafeArea()
        }
    }
}

#Preview {
    Images()
}
