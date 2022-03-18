//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation


struct ChecklistItem{
    let title: String
    let isChecked: Bool
    
    init(title: String, isChecked: Bool){
        self.title = title
        self.isChecked = isChecked
    }
    
    func getTitle() -> String{
        return self.title
    }
    
    func getisChecked() -> Bool{
        return self.isChecked
    }
}

let game1 : ChecklistItem = ChecklistItem(title: "League of Legend",isChecked: true)
let game2 : ChecklistItem = ChecklistItem(title: "Apex",isChecked: false)
let game3 : ChecklistItem = ChecklistItem(title: "Ghost of Thushima",isChecked: true)
let game4 : ChecklistItem = ChecklistItem(title: "Valorant",isChecked: false)


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
