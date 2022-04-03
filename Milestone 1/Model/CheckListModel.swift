//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation


class CheckList: Identifiable {
    var title: String
//    var lists: [String] = []
    var lists = [
    "Number1",
    "Number2",
    "Number3"
    ]
    
    init(title: String) {
        self.title = title
    }
}



