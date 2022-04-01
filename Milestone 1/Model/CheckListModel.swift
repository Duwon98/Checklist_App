//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation


//var checkList = [CheckList]()

class CheckList: Identifiable{
    var title: String
    var lists: [String] = []
    
    init(title: String) {
        self.title = title
    }
}



