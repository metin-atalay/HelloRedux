//
//  ContentView.swift
//  Shared
//
//  Created by Metin Atalay on 3.06.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    struct Props {
        let  counter: Int
        let  onIncrement: () -> Void
        let  onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state: State) -> Props {
        Props(counter: state.counter) {
            store.dispatch(action: IncrementAction())
        } onDecrement: {
            store.dispatch(action: DecrementAction())
        } onAdd: {
            store.dispatch(action: AddAction(value: $0))
        }
    }
    
    var body: some View {
        let props = map(state: store.state)
        
        VStack(alignment: .center, spacing: 10) {
            
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
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        let store = Store(reducer: reducer)
        
        ContentView().environmentObject(store)
    }
}
