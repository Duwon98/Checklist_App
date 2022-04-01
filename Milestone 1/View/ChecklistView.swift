//
//  MasterView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

//Master view
struct ChecklistView: View {
    var checklist: [CheckListViewModle]
    var body: some View {
        List(checklist) {list in
            NavigationLink("\(list.checklist.title)"){
            CheckListDetailView(list: list)
                    .navigationTitle("Detail view")
            }
            
        }.navigationTitle("CheckLists")
            .toolbar {
                EditButton()
            }
           
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(checklist: [])
    }
}
