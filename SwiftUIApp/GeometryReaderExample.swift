//
//  GeometryReaderExample.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/25/26.
//

import SwiftUI


struct SizePreferenceKey: PreferenceKey {
    typealias Value = CGSize
    
    static let defaultValue: Value = .zero
    
    static func reduce(value: inout CGSize, nextValue: () -> CGSize) {
        value = nextValue()
    }
}

struct MeasuringSizeModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .preference(
                            key: SizePreferenceKey.self,
                            value: proxy.size
                        )
                }
            )
    }
}

extension View {
    func measureSize(perform action: @escaping (CGSize) -> Void) -> some View {
        modifier(MeasuringSizeModifier())
            .onPreferenceChange(SizePreferenceKey.self, perform: action)
    }
}

// GeometryReader for custom layouts - retriggers when parent is changed
// only use when absolutely necessary
// avoid nesting multiple geometry reader
struct GeometryReaderExample: View {
    
    @State private var viewSize: CGSize = CGSize(width: 200, height: 50)
    @State private var lastSize: CGSize = CGSize(width: 200, height: 50)
    
    // Example 6 - Preference key
    var body: some View {
        VStack {
            ZStack(alignment: .bottomTrailing) {
                Text("This view knows its own size")
                    .frame(width: viewSize.width, height: viewSize.height)
                    .background(Color.yellow)
                    .clipShape(.rect(cornerRadius: 10))
                    .measureSize { size in
                        viewSize = size
                    }
                    .overlay(alignment: .bottomTrailing) {
                        Image(systemName: "square.resize")
                            .resizable()
                            .rotationEffect(.degrees(90))
                            .foregroundStyle(.yellow)
                            .frame(width: 20, height: 20)
                            .background(.white.gradient)
                            .offset(x: 5, y: 5)
                            .gesture(
                                DragGesture()
                                    .onChanged({ gesture in
                                        let newWidth = max(100, lastSize.width + gesture.translation.width)
                                        let newHeight = max(40, lastSize.height + gesture.translation.height)
                                        viewSize = CGSize(width: newWidth, height: newHeight)
                                    })
                                    .onEnded({ _ in
                                        lastSize = viewSize
                                    })
                            )
                    }
            }
        }
        
        Text("Width: \(Int(viewSize.width)), Height: \(Int(viewSize.height))")
    }
    
    // Example 5 - Custom Tab Bar
//    let tabs = ["Home", "Search", "Notifications", "Profile"]
//    @State var selectedTab = 0
//    
//    func tabIcon(for index: Int) -> String {
//        switch index {
//        case 0: return "house.fill"
//        case 1: return "magnifyingglass"
//        case 2: return "bell.fill"
//        case 3: return "person.fill"
//        default: return "circle.fill"
//        }
//    }
//    
//    var body: some View {
//        VStack {
//            Spacer()
//            
//            GeometryReader { geoProxy in
//                
//                let tabWidth = geoProxy.size.width / CGFloat(tabs.count)
//                
//                ZStack(alignment: .leading) {
//                    Rectangle()
//                        .fill(.white)
//                        .frame(height: 80)
//                        .shadow(radius: 10)
//                    
//                    // Default
////                    UnevenRoundedRectangle(bottomLeadingRadius: 10, topTrailingRadius: 10)
////                        .stroke(Color.blue, lineWidth: 10)
////                        .frame(width: tabWidth, height: 80)
////                        .offset(x: CGFloat(selectedTab) * tabWidth, y: 0)
////                        .animation(.spring(), value: selectedTab)
//                    
//                    UnevenRoundedRectangle(topLeadingRadius: 10, bottomTrailingRadius: 10)
//                        .fill(Color.blue)
//                        .frame(width: tabWidth, height: 10)
//                        .offset(x: CGFloat(selectedTab) * tabWidth, y: -40)
//                        .animation(.spring(), value: selectedTab)
//                    
//                    UnevenRoundedRectangle(bottomLeadingRadius: 10, topTrailingRadius: 10)
//                        .fill(Color.blue)
//                        .frame(width: tabWidth, height: 10)
//                        .offset(x: CGFloat(selectedTab) * tabWidth, y: 40)
//                        .animation(.spring(), value: selectedTab)
//                    
//                    HStack(spacing: 0) {
//                        ForEach(0..<tabs.count, id: \.self) { index in
//                            Button(action: {
//                                selectedTab = index
//                            }) {
//                                VStack(spacing: 4) {
//                                    Image(systemName: tabIcon(for: index))
//                                        .font(.system(size: 20))
//                                    
//                                    Text(tabs[index])
//                                        .font(.caption)
//                                }
//                                .foregroundStyle(selectedTab == index ? .blue : .gray)
//                                .frame(width: tabWidth, height: 80)
//                            }
//                        }
//                    }
//                }
//            }
//            .frame(height: 80)
//        }
//    }
    
    // Example 4 - Card View
//    var body: some View {
//        GeometryReader { geometryProxy in
//            VStack(spacing: 0) {
//                Image(.image1)
//                    .resizable()
//                    .scaledToFill()
//                    .frame(height: geometryProxy.size.height * 0.6)
//                    .clipped()
//                
//                VStack(alignment: .leading) {
//                    Text("Hello")
//                        .font(.headline)
//                    
//                    Text("This is a card with proportional sizing based on the available space in the Geometry Reader. The image takes 60% and content takes remaining 40%")
//                    
//                    Spacer()
//                    
//                    HStack {
//                        Spacer()
//                        
//                        Text("Learn More")
//                            .font(.caption)
//                            .foregroundStyle(.blue.gradient)
//                            .padding(.vertical, 8)
//                            .padding(.horizontal, 12)
//                            .background(.blue.opacity(0.2))
//                            .clipShape(.rect(cornerRadius: 4))
//                    }
//                }
//                .padding()
//                .frame(height: geometryProxy.size.height * 0.4)
//            }
//            .background(.white)
//            .clipShape(.rect(cornerRadius: 20))
//            .shadow(radius: 5)
//        }
//        .frame(height: 500)
//        .padding()
//    }
    
    // Example 3

//    let items = Array(1...20).map { "item \($0)" }
//    let columns = 3
//    let spacing: CGFloat = 10
//
//    func gridItems(width: CGFloat) -> [GridItem] {
//        Array(repeating: GridItem(.fixed(width), spacing: spacing), count: columns)
//    }
//
//    
//    var body: some View {
//        
//        GeometryReader { geo in
//            ScrollView {
//                let totalSpacing = spacing * CGFloat(columns - 1)
//                let itemWidth = (geo.size.width - totalSpacing) / CGFloat(columns)
//
//                LazyVGrid(columns: gridItems(width: itemWidth), spacing: spacing) {
//                    ForEach(items, id: \.self) { item in
//                        Text(item)
//                            .frame(height: 100)
//                            .frame(maxWidth: .infinity)
//                            .background(.blue.opacity(0.2))
//                            .clipShape(.rect(cornerRadius: 10))
//                    }
//                }
//            }
//        }
//        .padding()
//    }

    // Example 2
    
//    func geometryString(_ frame: CGRect) -> String {
//        "{ x: \(Int(frame.origin.x)), y: \(Int(frame.origin.y)), w: \(Int(frame.width)), h: \(Int(frame.height)) }"
//    }
    
//    var body: some View {
//        VStack {
//            Text("Coordinate spaces")
//                .font(.headline)
//                .padding()
//            
//            ZStack {
//                Color.gray.opacity(0.3)
//                
//                GeometryReader { geometry in
//                    Rectangle()
//                        .foregroundStyle(LinearGradient(colors: [.orange, .pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    
//                    VStack(alignment: .leading) {
//                        Text("Local : \(geometryString(geometry.frame(in: .local)))")
//                        Text("Global : \(geometryString(geometry.frame(in: .global)))")
//                    }
//                    .position(x: geometry.size.width/2, y: geometry.size.height/2 )
//                    .font(.caption.bold())
//                    .foregroundStyle(.white)
//                }
//            }
//            .frame(height: 300)
//            
//        }
//    }
    
        // Example 1
//    var body: some View {
//
//        GeometryReader { geometry in
//            VStack {
//                Text("Width \(geometry.size.width)")
//                    .font(.headline)
//                
//                Text("Height \(geometry.size.height)")
//                    .font(.headline)
//                
//                Rectangle()
//                    .foregroundStyle(LinearGradient(colors: [.orange, .pink, .red], startPoint: .topLeading, endPoint: .bottomTrailing))
//                    .frame(width: geometry.size.width * 0.8, height: geometry.size.height * 0.8)
//            }
//            .frame(maxWidth: .infinity, maxHeight: .infinity)
//        }
//        .frame(height: 300)
////        .ignoresSafeArea()
//        .border(.gray)
//                
//    }
}

#Preview {
    GeometryReaderExample()
}
