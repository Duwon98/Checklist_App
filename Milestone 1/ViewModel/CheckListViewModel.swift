//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation

class CheckListViewModle: Identifiable{
    var checklist: CheckList
    
    init(checklist: CheckList){
        self.checklist = checklist
    }
}
