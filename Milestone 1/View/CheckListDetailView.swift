//
//  CheckListDetailView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

struct CheckListDetailView: View {
    @ObservedObject var list: CheckListViewModel
    /// The addString variable will check if user put text in add section. if user push add button without any text in it, empty text won't be added to the subList.
    @State var addString : String = ""
    /// Edit mode or not
    @Environment(\.editMode) var mode
    /// if Undo button is pressed, Reset button will be shown(if it's true it Reset button will be shown)
    @State var reSetUndo = false
    
    var body: some View {
        VStack{
            /// If you are on the edit mode -> you can edit the navigation title (which is checklist title)
            if self.mode?.wrappedValue.isEditing ?? true  {
                HStack{
                    Text("📝")
                    TextField((list.checklist.title), text:$list.checklist.title ,
                    onCommit: {
                        Milestone_1App.save()
                    }).navigationTitle(" ")
                }
            }

            /// Listing the subLists
            List{
                /// It will loop the index of each subList.
                ForEach(list.index, id: \.self){i in
                    HStack{
                        /// if you are on the edit mode -> display the delete button
                        Button(" ", action: {
                            list.tick(position: i)
                        })
                     
                        
                    /// If it's edit mode, you can also change the name of the subList.
                    if self.mode?.wrappedValue.isEditing ?? true  {
                        TextField((list.checklist.subList[i]), text:$list.checklist.subList[i],  onCommit: {
                            Milestone_1App.save()
                        })
                    }
                    /// if it's not edit mode, it will just shows subLists of checklist.
                    else{
                        Text(list.checklist.subList[i])
                    }
                    /// if the ticklist of list is true, shows "ticked" Text
                        if(list.tickList[i]){
                            Spacer()
                            Text("✓")
                        }

                    }
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
                
                ///if you are on the edit mode -> display the add subList row
                if self.mode?.wrappedValue.isEditing ?? true{
    
                HStack{
                Button("Add", action: {
                    /// Users must put some text to add the subList
                    if (addString != "" ){
                        list.addList(name: addString)
                        addString = ""
                    }
                }).buttonStyle(BorderlessButtonStyle())
                TextField(("Please put something"), text:$addString)
                        }
                    }
                }
            .toolbar{
                    ToolbarItem(placement: .navigationBarTrailing){
                        /// if you are on the edit mode -> display the reset button
                        if self.mode?.wrappedValue.isEditing ?? true{
                        /// everytime if you click the reset button it will switch to Undo button
                            if (!reSetUndo){
                                Button("Reset", action: {
                                    reSet()
                                })
                            }else{
                                Button("Undo", action: {
                                    unDo()
                                })
                            }
                        }
                    }
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()

                        }
                }
                
            }.navigationTitle(list.checklist.title)

        }
    
    /// <#Description#>
    /// This function will save the current tickList(for Undo)
    /// and also call the removeTickList function
    func reSet(){
        list.previousTickList = list.returnTickList()
        list.removeTickList()
        reSetUndo = true
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// This function will call the updateUndo function from CheckLstViewModel
    func unDo(){
        list.updateUndo(previousOne: list.previousTickList)
        reSetUndo = false
        Milestone_1App.save()
    }
    
    /// <#Description#>
    /// Following function is for moving the subLists[array] from checklist.
    ///   - Parameters:
    ///     - source:move it FROM where(which index)
    ///     - destination: where TO move(which index)
    func move(from source: IndexSet, to destination:Int) {
        /// inorder to change source(IndexSet) to Int
        let index = source.endIndex.description
        let position = index.index(index.startIndex, offsetBy: 6)
        var from : Int
        from = Int(index[position].description) ?? 10
        
        /// Those operations are fixing the issues fo OnMove (It pass wrong index)
        if (list.index.count == from || from-1 == 0 && destination == 0 ){
            list.moveIndex(from: from-1, to: destination)
        }
        
        else if (from-1 == 0 || from-1 < destination-1){
            list.moveIndex(from: from-1, to: destination-1)
        }
        
        else{
            list.moveIndex(from: from-1, to: destination)
        }
            }
    
    /// <#Description#>
    /// Following function is to delete subList[array] from checklist
    ///   - Parameters:
    ///     - offsets:delete it FROM where(which index)
    func delete(at offsets: IndexSet) {
        /// to change type to int
        let index = offsets.endIndex.description
        let position = index.index(index.startIndex, offsetBy: 6)
        var num : Int
        num = Int(index[position].description) ?? 10
        list.deleteList(position: num-1)

    }
    
    
}



//
//struct CheckListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListDetailView(list: CheckListViewModel(checklist: CheckList(title: "some list")))
//    }
//}
