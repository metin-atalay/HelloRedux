//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Metin Atalay on 4.06.2022.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) ->AppState {
    
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    state.taskState = taskReducer(state.taskState, action)
    state.personState = personReducer(state.personState, action)
    
    return state
}
