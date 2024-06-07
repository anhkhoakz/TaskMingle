//
//  TaskMingleApp.swift
//  TaskMingle
//
//  Created by Nguyễn Khoa on 7/6/24.
//

import SwiftUI

@main
struct TaskMingleApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands{
            CommandMenu("Task") {
                Button("Add New Task") {
                }
                .keyboardShortcut(KeyEquivalent("r"), modifiers: .command)
            }
            
            CommandGroup(after: .newItem) {
                Button("Add New Group") {
                    
                }
            }
        }
        WindowGroup("Special window") {
            Text("special window")
                .frame(minWidth: 200, maxWidth: 300, maxHeight: 200)
        }
        .defaultPosition(.leading)
        
        Settings {
            Text("Setting")
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
        }
        
        MenuBarExtra("Menu") {
            Button("Do something") {
                
            }
        }
    }
}
