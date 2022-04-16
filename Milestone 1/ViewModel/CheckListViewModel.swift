//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation
//View Model
class CheckListViewModle: Identifiable, ObservableObject {
    @Published var checklist: CheckList
    // class Checklist
    @Published var tickList = [Bool]()
    // each checklist have tickList array (False is unticked)
    @Published var previousTickList = [Bool]()
    // To save previousTickList(undo function)
    var index = [Int]()
    // To present the checklist's list
    var maxIndex = -1
    // max index of checklist's array

    // To add list in checklist, it get title of the list
    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.checklist.lists.append(name)
      self.tickList.append(false)
      self.previousTickList.append(false)
    }
    
    // To delete list in checklist, it get position of the list
    func deleteList(position: Int){
        self.maxIndex -= 1
        self.index.removeLast()
        self.checklist.lists.remove(at: position)
        self.tickList.remove(at: position)
        self.previousTickList.remove(at: position)
    }
    // get position of the list, if it's false it will switch to true otherwise to false. False is unticked
    func tick(position: Int){
        self.tickList[position] = !(self.tickList[position])
    }
    // it will return tickList to save a current ticklist for Undo function
    func returnTickList() -> [Bool]{
        return tickList
    }
    // it will change all the values of tickList to false. which is unticked
    func removeTickList() {
        for i in 0 ..< tickList.count{
            self.tickList[i] = false
        }
    }
    //  it will switch current tickList to previousOne
    func updateUndo(previousOne: [Bool]){
        self.tickList = previousOne
    }
    
    init(checklist: CheckList){
        self.checklist = checklist
    }
}
