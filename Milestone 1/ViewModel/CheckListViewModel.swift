//
//  CheckListViewModel.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import Foundation

class CheckListViewModle: Identifiable, ObservableObject {
    @Published var checklist: CheckList
    var title: String{
        get { checklist.title}
        set { checklist.title = newValue}
    }
    
    var lists: [String]{
        get { checklist.lists}
        set { checklist.lists = newValue}
    }
    
    
    init(checklist: CheckList){
        self.checklist = checklist
    }
}
