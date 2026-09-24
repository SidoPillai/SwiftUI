//
//  ScrollViewExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/24/26.
//

import SwiftUI

struct DTCourse: Identifiable {
    let id = UUID()
    var image: ImageResource
    var title: String
    var description: String
    var summary: String
}

extension DTCourse {
    static var sample: [DTCourse] {
        [
            .init(image: .image1, title: "Intro to Swift", description: "Understanding the basics of Swift", summary: "Beginner friendly course 40+ hours"),
            
            .init(image: .image2, title: "Intro to SwiftUI", description: "Understanding the basics of SwiftUI", summary: "Beginner friendly course 30+ hours"),
            
            .init(image: .image3, title: "Intro to iOS", description: "Understanding the basics of iOS app development", summary: "Beginner friendly course 80+ hours"),
            
            .init(image: .image4, title: "Intro to CoreDate", description: "Understanding the basics of CoreData", summary: "Intermediate level course 5+ hours"),
            
            .init(image: .image1, title: "Intro to HealthKit", description: "Understanding the basics of HealthKit", summary: "Beginner friendly course 5+ hours")
        ]
    }
}

struct ScrollViewExample: View {
    
    @State private var randomData = Array(0..<5)
    
    var body: some View {
//        ScrollView {
//            VStack {
//                Text("Courses")
//                    .font(.largeTitle)
//                    .bold()
//                
//                ForEach(DTCourse.sample) { course in
//                    CardView(course: course)
//                }
//            }
            
            
//            VStack(spacing: 15) {
//                Text ("Hello")
//                    .font(.largeTitle)
//                
//                ForEach(0..<200) { idx in
//                    Text("Item \(idx)")
//                        .padding()
//                        .frame(height: 50)
//                        .frame(maxWidth: .infinity)
//                        .background(
//                            Color.mint.opacity(0.2),
//                            in: RoundedRectangle(cornerRadius: 20)
//                        )
//                }
//            }
//            .padding()
//        }
//        .scrollIndicators(.hidden)
        
        NavigationStack {
            List {
                ForEach(randomData, id: \.self) { item in
                    Text("Item \(item + 1)")
                }
            }
            .navigationTitle("Items")
            .refreshable {
                await fetchData()
            }
        }
    }
    
    private func fetchData() async {
        do {
            let (_, _) = try await URLSession.shared.data(from:
            URL(string: "https://httpbin.org/delay/5")!)
            
            randomData.append(Int.random(in: 10...10000))
        }
        catch {
            print("error \(error.localizedDescription)")
        }
    }

}

struct CardView: View {
    var course: DTCourse
    
    var body: some View {
        VStack(spacing: 16) {
            Image(course.image)
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 144)
                .clipped()
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    
                    HStack {
                        Text(course.title)
                            .font(.title)
                            .bold()
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack {
                        Text(course.description)
                            .font(.title3)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(.leading)
                    
                    HStack {
                        Text(course.summary)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                        Spacer()
                    }
                    .padding(.leading)
                }
                .frame(maxWidth: .infinity)
                .padding(.bottom)
            }
        }
        .clipShape(.rect(cornerRadius: 20))
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray.opacity(0.2), lineWidth: 0.5)
                .shadow(color: .red, radius: 4)
        }
        .padding()
    }
}

#Preview {
    ScrollViewExample()
}
