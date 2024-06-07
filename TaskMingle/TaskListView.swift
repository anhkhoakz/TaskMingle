//
//  TaskListView.swift
//  TaskMingle
//
//  Created by Nguyễn Khoa on 7/6/24.
//

import SwiftUI

struct TaskListView: View {
    let title: String
    @Binding var tasks : [Task]
    @State private var selectedTask: Task? = nil
    @State private var isInspectorShown: Bool = false
    
    var body: some View {
        List($tasks) {$task in
            TaskView(task: $task, selectedTask: $selectedTask, isInspectorShown: $isInspectorShown)
        }
        .navigationTitle(title)
        .toolbar{
            ToolbarItemGroup {
                Button {
                    tasks.append(Task(title: "New Task"))
                } label: {
                    Label("Add New Task", systemImage: "plus")
                }
                Button {
                    isInspectorShown.toggle()
                } label: {
                    Label("Show inspector", systemImage: "sidebar.right")
                }
            }
        }
        .inspector(isPresented: $isInspectorShown) {
            Group {
                if let selectedTask {
                    Text(selectedTask.title).font(.title)
                } else {
                    Text("Nothing selected")
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
}

#Preview {
    TaskListView(title: "All", tasks: .constant(Task.examples()))
}
