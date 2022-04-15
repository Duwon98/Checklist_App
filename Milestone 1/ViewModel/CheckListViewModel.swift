//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation

class CheckListViewModle: Identifiable, ObservableObject {
    @Published var checklist: CheckList
    @Published var tickList = [Bool]()
    @Published var previousTickList = [Bool]()
    var index = [Int]()
    var maxIndex = -1

    
    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.checklist.lists.append(name)
      self.tickList.append(false)
      self.previousTickList.append(false)
    }
    
    func deleteList(position: Int){
        self.maxIndex -= 1
        self.index.removeLast()
        self.checklist.lists.remove(at: position)
        self.tickList.remove(at: position)
        self.previousTickList.remove(at: position)
    }
    
    func tick(position: Int){
        self.tickList[position] = !(self.tickList[position])
    }
    
    func returnTickList() -> [Bool]{
        return tickList
    }
    
    func removeTickList() {
        for i in 0 ..< tickList.count{
            self.tickList[i] = false
        }
    }
    
    func updateUndo(previousOne: [Bool]){
        self.tickList = previousOne
    }
    
    init(checklist: CheckList){
        self.checklist = checklist
    }
}
