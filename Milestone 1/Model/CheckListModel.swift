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
    @Published var lists = [String]()
    @Published var tickList = [Bool]()
    var index = [Int]()
    var maxIndex = -1
    

    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.lists.append(name)
    self.tickList.append(false)
    
    }
    
    func deleteList(position: Int){
        self.maxIndex -= 1
        self.index.removeLast()
        self.lists.remove(at: position)
        self.tickList.remove(at: position)
    }
    
    func tick(position: Int){
        self.tickList[position] = !(self.tickList[position])
    }
    
    init(title: String) {
        self.title = title
    }
}


