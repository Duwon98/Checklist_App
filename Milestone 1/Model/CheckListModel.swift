//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation

// Model
class CheckList: Identifiable, ObservableObject, Codable {
    var title: String
    //Checklist title
    var lists = [String]()
    //Checklist's list (it is array)
    init(title: String) {
        self.title = title
    }
}



