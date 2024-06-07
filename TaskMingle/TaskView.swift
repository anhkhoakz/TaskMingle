//
//  TaskView.swift
//  TaskMingle
//
//  Created by Nguyễn Khoa on 7/6/24.
//

import SwiftUI

struct TaskView: View {
    @Binding var task: Task
    @Binding var selectedTask: Task?
    @Binding var isInspectorShown: Bool
    
    
    var body: some View {
        HStack{
            Image(systemName: task.isCompleted ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    task.isCompleted.toggle()
                }
            TextField("New Task", text: $task.title)
                .textFieldStyle(.plain)
            
            Button(action: {
                isInspectorShown = true
                selectedTask = task
                
            }) {
                Image(systemName: "info")
            }
            .buttonStyle(.borderless)
        }
    }
}

#Preview {
    TaskView(task: .constant(Task.example()), selectedTask: .constant(nil), isInspectorShown: .constant(false))
        .padding()
}
