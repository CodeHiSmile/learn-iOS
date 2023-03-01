//
//  AddTaskView.swift
//  ToDoAppDemo
//
//  Created by Newwave on 01/03/2023.
//

import SwiftUI

struct AddTaskView: View {
    @State private var title: String = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var reamManager: RealmManager
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Create a new task")
                .font(.title2).bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            
            TextField("Enter your task here",
                      text: $title
            )
                .textFieldStyle(.roundedBorder)
            
            Button{
                if title != "" {
                    reamManager.addTask(taskTitle: title)
                }
                
                dismiss()
            } label: {
                Text("Add task")
                    . foregroundColor(.white)
                    .padding()
                    .padding(.horizontal)
                    .background(Color(hue: 0.328,
                                      saturation: 0.796,
                                      brightness: 0.408))
                    .cornerRadius(30)
                
            }
            
            Spacer()
            
        }
        .padding(.top, 40)
        .padding(.horizontal)
        .background(Color(hue: 0.086, saturation: 0.141, brightness: 0.972))
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
            .environmentObject(RealmManager())
    }
}