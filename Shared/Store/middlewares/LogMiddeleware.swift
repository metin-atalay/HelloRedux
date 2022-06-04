//
//  LogMiddeleware.swift
//  HelloRedux
//
//  Created by Metin Atalay on 4.06.2022.
//

import Foundation

func logMiddleware() -> Middleware<AppState> {
    
    return {state,action,dispatch in
        print("[Log Middleware]")
    }
    
}
