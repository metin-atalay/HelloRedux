//
//  PesonReducer.swift
//  HelloRedux
//
//  Created by Metin Atalay on 4.06.2022.
//

import Foundation


func personReducer(_ state : PersonState, _ action : Action) -> PersonState {
    
    var state = state
    
    switch action {
    case let action as AddPersonAction:
        state.person.append(action.person)
        
    default:
        break
    }
    
    return state
}
