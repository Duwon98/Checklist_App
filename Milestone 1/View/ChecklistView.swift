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
                CheckListRowView(checklist: list)

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






//List {
//    ForEach(checklist) {list in
//    Text(list.checklist.title)
//}
//.onDelete { checklist.remove(atOffsets: $0) }
//
//
//}

struct CheckListRowView: View {
    @ObservedObject var checklist: CheckListViewModle
    
    var body: some View {
        NavigationLink("\(checklist.title)"){
            CheckListDetailView(list: checklist)
                .navigationTitle(checklist.title)
        }
    }
}
