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

//            Button("Add", action: add ).position(x:20,y: 0)
            List{
                ForEach(checklist){list in
                    CheckListRowView(checklist: list)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("CheckLists")
            .toolbar{

                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                     EditButton()
                 }
                 
                 ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                     Button("Add", action: add)
                 }
            }
        

    }
    
    func delete(at offsets: IndexSet) {
        checklist.remove(atOffsets: offsets)
    }
    
    func add(){
        checklist.append(CheckListViewModle(checklist: CheckList(title: "Checklist")))
    }
}
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(checklist: [])
    }
}


