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
    let playing: Bool
    let id = UUID()
}

var games = [
    Game(name: "League of Legend", playing: true),
    Game(name: "Apex", playing: false),
    Game(name: "Ghost of Tsushima",playing: true),
    Game(name: "Valorant",playing: false)
]
