//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation

/// <#Description#>
/// It is a View Model
class CheckListViewModel: Identifiable, ObservableObject, Decodable, Encodable {
    /// Checklist Model
    @Published var checklist: CheckList
    /// each checklist have tickList array (False is unticked)
    @Published var tickList = [Bool]()
    /// To save previousTickList(undo function)
    @Published var previousTickList = [Bool]()
    /// To present the checklist's list
    @Published var index = [Int]()
    /// max index of checklist's array
    @Published var maxIndex = -1


    /// <#Description#>
    ///  To add subList in checklist, it get name of the subList
    ///
    ///   - Parameters:
    ///     - name: <# it get title of the list#>
    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.checklist.subList.append(name)
      self.tickList.append(false)
      self.previousTickList.append(false)
      Milestone_1App.save()
    }
    
    /// <#Description#>
    /// To delete subList from checklist
    ///
    ///  - Parameters:
    ///     - position: <# it gets the position of the list#>
    func deleteList(position: Int){
        self.maxIndex -= 1
        self.index.removeLast()
        self.checklist.subList.remove(at: position)
        self.tickList.remove(at: position)
        self.previousTickList.remove(at: position)
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// If the subList is clicked by user, the tickList of subList(same index) will change to True or False
    /// if it's false it will switch to true otherwise to false. False is unticked
    ///
    ///  - Parameters:
    ///     - position: <# it gets the position of the list#>
    func tick(position: Int){
        self.tickList[position] = !(self.tickList[position])
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// it will return tickList to save a current ticklist for Undo function
    ///
    ///  - Returns: <# it returns the current ticklist #>
    func returnTickList() -> [Bool]{
        return tickList
    }
    
    /// <#Description#>
    /// it will change all the values of tickList to false. which is unticked
    func removeTickList() {
        for i in 0 ..< tickList.count{
            self.tickList[i] = false
        }
        Milestone_1App.save()
    }
    /// <#Description#>
    /// it will switch current tickList to previousOne
    func updateUndo(previousOne: [Bool]){
        self.tickList = previousOne
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// It will change change between two list values
    ///
    ///  - Parameters:
    ///     - from:  <# it gets index of from ex) from where to move #>
    ///     - to: <# it gets index of to ex) where to move#>
    func moveIndex(from: Int, to: Int){
        var temList : String
        temList = self.checklist.subList[from]
        
        ///switch the values
        self.checklist.subList.remove(at: from)
        self.checklist.subList.insert(temList, at: to)
        
        ///switch ticklist
        var tick : Bool
        tick = self.tickList[from]
        self.tickList.remove(at: from)
        self.tickList.insert(tick, at: to)
        Milestone_1App.save()
        
    }
    
    init(checklist: CheckList){
        self.checklist = checklist
    }
    
    /// <#Description#>
    /// In order to create the Keys for Json
    enum CodingKeys:String, CodingKey, RawRepresentable{
        case checklist
        case tickList
        case previousTickList
        case index
        case maxIndex
    }
    
    /// <#Description#>
    /// Manually decoding the values (because Class has been used)
    required init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        checklist = try container.decode(CheckList.self, forKey: .checklist)
        tickList = try container.decode([Bool].self, forKey: .tickList)
        previousTickList = try container.decode([Bool].self, forKey: .previousTickList)
        index = try container.decode([Int].self, forKey: .index)
        maxIndex = try container.decode(Int.self, forKey: .maxIndex)
     }
    
    /// <#Description#>
    /// Manually encoding the values (because Class has been used)
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(checklist, forKey: .checklist)
        try container.encode(tickList, forKey: .tickList)
        try container.encode(previousTickList, forKey: .previousTickList)
        try container.encode(index, forKey: .index)
        try container.encode(maxIndex, forKey: .maxIndex)
    }
    

}

