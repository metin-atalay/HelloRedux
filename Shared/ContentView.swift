//
//  ContentView.swift
//  Shared
//
//  Created by Metin Atalay on 3.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPresented: Bool = false
    @EnvironmentObject var store: Store<AppState>
    
    struct Props {
        let  counter: Int
        let  onIncrement: () -> Void
        let  onDecrement: () -> Void
        let  onAdd: (Int) -> Void
        let  onIncrementAsync: () -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter) {
            store.dispatch(action: IncrementAction())
        } onDecrement: {
            store.dispatch(action: DecrementAction())
        } onAdd: {
            store.dispatch(action: AddAction(value: $0))
        } onIncrementAsync: {
            store.dispatch(action: IncrementActionAsync())
        }
    }
    
    var body: some View {
        let props = map(state: store.state.counterState)
        
        VStack(alignment: .center, spacing: 10) {
            
            
            Spacer()
            
            Text("\(props.counter)")
                .padding(5)
            
            Button {
                props.onIncrement()
            } label: {
                Text("onIncrement")
            }
            .padding(5)
            
            Button {
                props.onDecrement()
            } label: {
                Text("onDecrement")
            }
            .padding(5)
            
            Button {
                props.onAdd(3)
            } label: {
                Text("onAdd")
            }
            .padding(5)
            
            Button {
                props.onIncrementAsync()
            } label: {
                Text("onIncrementAsync")
            }
            .padding(5)
            
            Spacer()
            
            Button {
                isPresented = true
            } label: {
                Text("Add Task")
            }
            
            Spacer()
            
        } //: VSTACK
        .sheet(isPresented: $isPresented) {
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: counterReducer, state: CounterState())
        
        ContentView().environmentObject(store)
    }
}
