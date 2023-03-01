//
//  TasksView.swift
//  ToDoAppDemo
//
//  Created by Newwave on 01/03/2023.
//

import SwiftUI

struct TasksView: View {
    @EnvironmentObject var reamManager: RealmManager
    
    var body: some View {
        VStack{
            Text("My tasks")
                .font(.title2).bold()
                .padding(.horizontal)
                .padding(.top)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            List {
                ForEach(reamManager.tasks, id: \.id){ task in
                    if !task.isInvalidated {
                        TaskRow(task: task.title, completed: task.completed)
                            .onTapGesture {
                                reamManager.updateTask(id: task.id, completed: !task.completed)
                            }
                            .swipeActions(edge: .trailing) {
                                Button(role: .destructive) {
                                    reamManager.deleteTask(id: task.id)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                .listRowSeparator(.hidden)
            }
            .background(.clear)
            .scrollContentBackground(.hidden)
            
            Spacer()
        }
    }
}

struct TasksView_Previews: PreviewProvider {
    static var previews: some View {
        TasksView()
            .environmentObject(RealmManager())
    }
}
