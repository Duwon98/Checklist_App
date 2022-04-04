//
//  Module.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import Combine
import Foundation


class CheckList: Identifiable, ObservableObject {
    @Published var title: String
//    var lists: [String] = []
//    @Published var lists = [String]()
//    var index = [Int]()
//    var maxIndex = -1
    
    @Published var lists = ["Hello", "Hello2"]
    var index = [0,1]
    var maxIndex = 1
    
    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.lists.append(name)
    }
    
    func deleteList(position: Int){
        self.maxIndex -= 1
        self.index.removeLast()
        self.lists.remove(at: position)
    }
    
    init(title: String) {
        self.title = title
    }
}



