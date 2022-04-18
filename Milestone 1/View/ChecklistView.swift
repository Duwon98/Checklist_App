//
//  MasterView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

//Master view
struct ChecklistView: View {
    @Binding var checklist: [CheckListViewModle]
    @State var checklistExport = Milestone_1App.checklistExport
    

    var body: some View {
            List{
                ForEach(checklistExport){list in
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
        checklistExport.remove(atOffsets: offsets)
        checklist = checklistExport

        Milestone_1App.save()
    }
    
    func add(){
        checklistExport.append(CheckListViewModle(checklist: CheckList(title: "Checklist")))
        checklist = checklistExport

        Milestone_1App.save()
    }
    
    func initUpdate(){
        checklistExport = checklist
    }
    
}
//struct MasterView_Previews: PreviewProvider {
//    static var previews: some View {
//        ChecklistView(checklist: [])
//    }
//}
//
//
