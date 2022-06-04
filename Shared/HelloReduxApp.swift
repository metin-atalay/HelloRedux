//
//  HelloReduxApp.swift
//  Shared
//
//  Created by Metin Atalay on 3.06.2022.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    var body: some Scene {
        
        let store = Store(reducer: appReducer , state: AppState(), middlewares: [logMiddleware(), incrementMiddleware()])
        
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
