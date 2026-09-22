//
//  PhotoGallery.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/22/26.
//

import SwiftUI

struct PhotoGallery: View {
    
    @State private var selectedImage: String? = nil
    
    let images = ["image1", "image2", "image3", "image4"]
    
    var body: some View {
        
        NavigationStack {
            VStack {
                if let selectedImage {
                    PhotoView(
                        image: selectedImage,
                        onClose: {
                            self.selectedImage = nil
                        }
                    )
                } else {
                    ScrollView {
                        VStack {
                            ForEach(images, id: \.self) { image
                                in
                                Image(image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 300)
                                    .clipShape(.rect(cornerRadius: 10))
                                    .shadow(radius: 5)
                                    .onTapGesture {
                                        self.selectedImage = image
                                    }
                            }
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .navigationTitle("Photo Gallery")
        }
    }
}

struct PhotoView: View {
    let image: String
    let onClose: () -> Void
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            
            Image(self.image)
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 400)
                .clipShape(.rect(topLeadingRadius: 100, bottomTrailingRadius: 100))
                .overlay {
                    Rectangle()
                        .clipShape(.rect(topLeadingRadius: 100, bottomTrailingRadius: 100))
                        .opacity(0.2)
                }
        }
        .padding(.top, 20)
        .onTapGesture {
            self.onClose()
        }
        .navigationTitle("Photo View")
    }
}

#Preview {
    PhotoGallery()
}
