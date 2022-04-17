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
//    @State var checklist: [CheckListViewModle] = {
//        guard let data = try? Data(contentsOf: ChecklistView.fileURL),
//              let checklist = try? JSONDecoder().decode([CheckListViewModle].self, from: data)else{
//            return checklist: [CheckListViewModle]
//        }
//        return checklist
//    }
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
        Milestone_1App.save()
    }
    
    func add(){
        checklist.append(CheckListViewModle(checklist: CheckList(title: "Checklist")))
        Milestone_1App.save()
    }
    

    


    
}
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(checklist: [])
    }
}


