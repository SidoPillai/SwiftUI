//
//  TodoListApp.swift
//  SwiftUIApp
//
//  Created by Siddesh Pillai on 9/23/26.
//

import SwiftUI


struct TodoListApp: View {
    
    @State private var tasks: [String] = ["Buy groceries", "Wash Car"]
    @State private var newTask: String = ""
    
    var body: some View {
        NavigationStack {
            HStack {
                TextField("New task", text: $newTask)
                    .textFieldStyle(.roundedBorder)
                    .padding(.leading)
                
                Button(action: addTask) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundStyle(.blue)
                }
                .padding()
            }
            .padding()
            
            List {
                ForEach(tasks, id: \.self) { task in
                    Text(task)
                }
                .onDelete(perform: deleteTask(at:))
            }
            .navigationTitle("Todo List")
        }
    }
    
    func addTask() {
        if !newTask.isEmpty {
            tasks.append(newTask)
            newTask = ""
        }
    }
    
    func deleteTask(at offsets: IndexSet) {
        tasks.remove(atOffsets: offsets)
    }
}

#Preview {
    TodoListApp()
}
