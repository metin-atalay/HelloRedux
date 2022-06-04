//
//  Peson.swift
//  HelloRedux
//
//  Created by Metin Atalay on 4.06.2022.
//

import Foundation

struct Person: Identifiable {
    let id : UUID = UUID()
    var name : String
}
