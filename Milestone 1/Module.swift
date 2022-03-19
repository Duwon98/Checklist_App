//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation


struct Game: Identifiable{
    let name: String
    let id = UUID()
}

var games = [
    Game(name: "League of Legend"),
    Game(name: "Apex"),
    Game(name: "Ghost of Thushima"),
    Game(name: "Valorant")
]
