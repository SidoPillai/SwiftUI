//
//  ListExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/23/26.
//

import SwiftUI

struct Course: Identifiable {
    let id = UUID()
    var title: String
    var numberOfLessons: Int
    var thumbnail: ImageResource
}

struct ListExample: View {
    @State var courses = [
        Course(title: "Mastering SwiftUI", numberOfLessons: 15, thumbnail: .image1),
        Course(title: "Mastering Swift", numberOfLessons: 15, thumbnail: .image2),
        Course(title: "Mastering CoreImage", numberOfLessons: 15, thumbnail: .image3),
        Course(title: "Mastering ARKit", numberOfLessons: 40, thumbnail: .image4),
        Course(title: "Mastering VisionOS", numberOfLessons: 40, thumbnail: .image1),
        Course(title: "Mastering CoreML", numberOfLessons: 40, thumbnail: .image2),
        Course(title: "Mastering HealthKit", numberOfLessons: 40, thumbnail: .image3),
        Course(title: "Mastering WatchOS", numberOfLessons: 40, thumbnail: .image2),
        Course(title: "Mastering iPadOS", numberOfLessons: 40, thumbnail: .image3),
        Course(title: "Mastering iOS", numberOfLessons: 40, thumbnail: .image4)
    ]
    
    var body: some View {
        NavigationStack {

            List($courses, editActions: .delete) { $course in
                ListRowView(course: course)
//                    .listRowInsets(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
//                    .listRowSeparator(.visible)
//                    .listRowSeparatorTint(.red)
//                    .listRowBackground(Image(.image4))
//                    .listRowBackground(
//                        Ellipse()
//                            .background(Color.clear)
//                            .foregroundColor(.purple)
//                            .opacity(0.3)
//                    )
            }
            .background {
//                Color.orange.opacity(0.2).ignoresSafeArea()
                Image(.image1)
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                    .overlay {
                        Rectangle()
                            .fill(Color.black.opacity(0.4))
                            .ignoresSafeArea()
                    }
            }
            .scrollContentBackground(.hidden)
            .listStyle(.insetGrouped)
            .listRowSpacing(16)
            .navigationTitle("Courses")

//            List($courses, editActions: .delete) { $course in
//                VStack(alignment: .leading) {
//                    Text(course.title)
//                        .font(.headline)
//                    Text("Number of lessosns: \(course.numberOfLessons.description)")
//                        .font(.subheadline)
//                }
//            }
//            .navigationTitle("Courses")

//            List {
//                ForEach(courses) { course in
//                    VStack(alignment: .leading) {
//                        Text(course.title)
//                            .font(.headline)
//                        Text("Number of lessosns: \(course.numberOfLessons.description)")
//                            .font(.subheadline)
//                    }
//                }
//                .onDelete(perform: delete(at:))
//            }
//            .navigationTitle("Courses")
        }
    }
    
    func delete(at offset: IndexSet) {
        print("deleting,", offset)
        courses.remove(atOffsets: offset)
    }
}

struct ListRowView: View {
    let course: Course
    
    var body: some View {
        HStack {
            Image(course.thumbnail)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
            

            VStack(alignment: .leading) {
                Text(course.title).font(.headline).bold()
                Text("Number of lessosns: \(course.numberOfLessons.description)").font(.subheadline)
            }
            
            Spacer()
        }
    }
}

#Preview {
    ListExample()
}
