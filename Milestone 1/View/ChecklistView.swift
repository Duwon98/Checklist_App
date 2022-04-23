//
//  MasterView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

//Master view
struct ChecklistView: View {
    @Binding var checklist: [CheckListViewModel]
    ///@state MileStone_1App.checklistExport will be used in ChecklistView to display the changes of the values
    @State var checklistExport = Milestone_1App.checklistExport
    
    var body: some View {
            List{
                /// It will loop the checklistExport (Checklist)
                ForEach(checklistExport){list in
                    CheckListRowView(checklist: list)
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
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
    /// <#Description#>
    /// It will delete the checklist from checkListExport so that the changes will directly updated in the view
    /// After that checklist = checklistExport will uplate changes to checklist(Binding)
    ///   - Parameters:
    ///     - offsets:  <# It will take the Index of the checklist #>
    func delete(at offsets: IndexSet) {
        checklistExport.remove(atOffsets: offsets)
        checklist = checklistExport
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// Following function will append new checklist to the checklistExport.
    /// After that checklist = checklistExport will uplate changes to checklist(Binding)
    func add(){
        checklistExport.append(CheckListViewModel(checklist: CheckList(title: "Checklist")))
        checklist = checklistExport
        Milestone_1App.save()
    }
    
    /// <#Description#>
    ///  It will move the list position.
    /// After that checklist = checklistExport will uplate changes to checklist(Binding)
    ///   - Parameters:
    ///     - source:  <# It gets from index#>
    ///     - diestination:  <# It gets To index#>
    func move(from source: IndexSet, to destination:Int) {
        checklistExport.move(fromOffsets: source, toOffset: destination)
        checklist = checklistExport
        Milestone_1App.save()
    }
    

}
