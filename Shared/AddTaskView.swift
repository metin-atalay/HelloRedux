//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Metin Atalay on 4.06.2022.
//

import SwiftUI

struct AddTaskView: View {
    @State private var name: String = ""
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        
        let task: [Task]
    
        //dispatch
        var onTaskAdded: (Task) -> ()
    }
    
    private func map(state: TaskState) -> Props {
        return Props(task: state.tasks) { task in
            store.dispatch(action: AddTaskAction(task: task))
        }
    }
    
    var body: some View {
        
        let props = map(state: store.state.taskState)
        
        VStack{
            TextField("Enter Task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Button("Add") {
                props.onTaskAdded(Task(title: self.name))
            }
            
            List(props.task, id: \.id){ task in
                Text(task.title)
            }
            
            Spacer()
            
        }.padding()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: taskReducer, state: TaskState())
        AddTaskView().environmentObject(store)
    }
}
