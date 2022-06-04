//
//  Store.swift
//  HelloRedux (iOS)
//
//  Created by Metin Atalay on 3.06.2022.
//

import Foundation

typealias Dispatcher = (Action) -> Void

typealias Reducer<State: ReduxState> = (_ state: State, _ action: Action) -> State

typealias Middleware<StoreState: ReduxState> = (StoreState, Action, @escaping Dispatcher) -> Void


protocol ReduxState {}

struct AppState: ReduxState {
    var counterState = CounterState()
    var taskState = TaskState()
    var personState = PersonState()
}

struct TaskState: ReduxState {
    var tasks: [Task] = [Task]()
}

struct PersonState : ReduxState {
    var person : [Person] = []
}

struct CounterState: ReduxState {
    var counter = 0
}

protocol Action {}

struct IncrementAction: Action { }
struct IncrementActionAsync: Action {}
struct DecrementAction: Action {}
struct AddTaskAction: Action {
    let task: Task
}
struct AddPersonAction: Action {
    let person: Person
}

struct AddAction: Action {
    let value: Int
}

class Store<StoreState: ReduxState> :ObservableObject {
    var reducer : Reducer<StoreState>
    @Published var state: StoreState
    var middelewares: [Middleware<StoreState>]
    
    init(reducer: @escaping Reducer<StoreState>, state: StoreState, middlewares: [Middleware<StoreState>] = []  ) {
        self.reducer = reducer
        self.state = state
        self.middelewares = middlewares
    }
    
    func dispatch(action: Action) {
        DispatchQueue.main.async {
            self.state = self.reducer(self.state, action)
        }
        
        // run all middlewares
        
        middelewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
