//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation

class CheckListViewModle: Identifiable, ObservableObject, Decodable, Encodable {
    @Published var checklist: CheckList
    // class Checklist
    @Published var tickList = [Bool]()
    // each checklist have tickList array (False is unticked)
    @Published var previousTickList = [Bool]()
    // To save previousTickList(undo function)
    @Published var index = [Int]()
    // To present the checklist's list
    @Published var maxIndex = -1
    // max index of checklist's array
    
//    var checklist: CheckList{
//        get { checklist}
//        set { checklist = newValue}
//    }
    
    // To add list in checklist, it get title of the list
    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.checklist.lists.append(name)
      self.tickList.append(false)
      self.previousTickList.append(false)
      Milestone_1App.save()
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
        Milestone_1App.save()
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
        Milestone_1App.save()
    }
    //  it will switch current tickList to previousOne
    func updateUndo(previousOne: [Bool]){
        self.tickList = previousOne
    }
    
    // It will change change between two list values
    func moveIndex(from: Int, to: Int){
        // sometimes Swift index 0 output 1, index 1 output 0.
        // In order to fix the issues
        var f : Int, t : Int
        f = from
        t = to
        
        if (f == -1){
            f += 1
        }
        
        if (t == -1){
            t += 1
        }
        
        var temList : String
        temList = self.checklist.lists[f]
        
        //switch the values
        self.checklist.lists.remove(at: f)
        self.checklist.lists.insert(temList, at: t)
        
        //shiwch ticklist
        var tick : Bool
        tick = self.tickList[f]
        self.tickList.remove(at: f)
        self.tickList.insert(tick, at: t)
        
    }
    
    func save(){
        Milestone_1App.save()
    }
    
    
    
    init(checklist: CheckList){
        self.checklist = checklist
    }
    
    enum CodingKeys:String, CodingKey, RawRepresentable{
        case checklist
        case tickList
        case previousTickList
        case index
        case maxIndex
    }
    
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        checklist = try container.decode(CheckList.self, forKey: .checklist)
        tickList = try container.decode([Bool].self, forKey: .tickList)
        previousTickList = try container.decode([Bool].self, forKey: .previousTickList)
        index = try container.decode([Int].self, forKey: .index)
        maxIndex = try container.decode(Int.self, forKey: .maxIndex)
     }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(checklist, forKey: .checklist)
        try container.encode(tickList, forKey: .tickList)
        try container.encode(previousTickList, forKey: .previousTickList)
        try container.encode(index, forKey: .index)
        try container.encode(maxIndex, forKey: .maxIndex)
    }
    

}

