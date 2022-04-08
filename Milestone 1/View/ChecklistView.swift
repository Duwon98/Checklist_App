//
//  MasterView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

//Master view
struct ChecklistView: View {
    @State var checklist: [CheckList]
    var body: some View {

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
        checklist.append(CheckList(title: "Checklist"))
    }
    
}
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(checklist: [])
    }
}


