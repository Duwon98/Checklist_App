//
//  MasterView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

//Master view
struct ChecklistView: View {
    @State var checklist: [CheckListViewModle]
    var body: some View {
        
//            List(checklist) {list in
//                CheckListRowView(checklist: list)
//
//            }
//            .onDelete(perform: delete)
//            .navigationTitle("CheckLists")
//            .toolbar {
//                EditButton()
//                }
        
        List{
            ForEach(checklist){list in
                Text(list.title)
            }
            .onDelete(perform: delete)
        }
        .navigationTitle("CheckLists")
        .toolbar{
            EditButton()
        }
    }
    func delete(at offsets: IndexSet) {
        checklist.remove(atOffsets: offsets)
    }
}


struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(checklist: [])
    }
}




