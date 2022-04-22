//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation

/// <#Description#>
/// It is a View Model
class CheckListViewModle: Identifiable, ObservableObject, Decodable, Encodable {
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
    ///  To add list in checklist, it get title of the list
    ///
    ///   - Parameters:
    ///     - parameter_name: <# it get title of the list#>
    func addList(name: String){
      self.maxIndex += 1
      self.index.append(self.maxIndex)
      self.checklist.lists.append(name)
      self.tickList.append(false)
      self.previousTickList.append(false)
      Milestone_1App.save()
    }
    
    /// <#Description#>
    /// To delete list in checklist
    ///
    ///  - Parameters:
    ///     - parameter_position: <# it gets the position of the list#>
    func deleteList(position: Int){
        self.maxIndex -= 1
        self.index.removeLast()
        self.checklist.lists.remove(at: position)
        self.tickList.remove(at: position)
        self.previousTickList.remove(at: position)
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// get position of the list, if it's false it will switch to true otherwise to false. False is unticked
    ///
    ///  - Parameters:
    ///     - parameter_position: <# it gets the position of the list#>
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
    /// sometimes Swift index 0 output 1, index 1 output 0.
    /// In order to fix the issues
    func moveIndex(from: Int, to: Int){
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
        
        ///switch the values
        self.checklist.lists.remove(at: f)
        self.checklist.lists.insert(temList, at: t)
        
        ///shiwch ticklist
        var tick : Bool
        tick = self.tickList[f]
        self.tickList.remove(at: f)
        self.tickList.insert(tick, at: t)
        
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

