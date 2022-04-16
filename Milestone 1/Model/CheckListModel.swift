//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation

// Model
class CheckList: Identifiable, ObservableObject {
    @Published var title: String
    //Checklist title
    @Published var lists = [String]()
    //Checklist's list (it is array)
    init(title: String) {
        self.title = title
    }
}



