//
//  CheckListDetailView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

struct CheckListDetailView: View {
    @ObservedObject var list: CheckListViewModle
    @State var addString : String = ""
    @Environment(\.editMode) var mode
    @State var copyCheckedList = [Bool]()
    @State var reSetUndo = false
    @State var saveing = false
    
    var body: some View {
        VStack{
            // If you are on the edit mode -> you can edit the navigation title
            if self.mode?.wrappedValue.isEditing ?? true  {
                HStack{
                    Text("📝")
                    TextField((list.checklist.title), text:$list.checklist.title,
                    onCommit: {
                        Milestone_1App.save()
                    }).navigationTitle(" ")

                }
            }

            // Listing the lists
            List{
                ForEach(list.index, id: \.self){i in
                    HStack{
                        // if you are on the edit mode -> display the delete button
                        Button(" ", action: {
                            list.tick(position: i)
                        })
                     
                        
                    // If it's edit mode, you can also edit the list
                    if self.mode?.wrappedValue.isEditing ?? true  {
                        TextField((list.checklist.lists[i]), text:$list.checklist.lists[i],  onCommit: {
                            Milestone_1App.save()
                        })
                    }else{
                        Text(list.checklist.lists[i])
                    }
                        
                        if(list.tickList[i]){
                            Spacer()
                            Text("✓")
                        }

                    }
                }
                .onMove(perform: move)
                .onDelete(perform: delete)
                
//              if you are on the edit mode -> display the add list row
                if self.mode?.wrappedValue.isEditing ?? true{
    
                HStack{
                Button("Add", action: {
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
                        // if you are on the edit mode -> display the reset button
                        if self.mode?.wrappedValue.isEditing ?? true{
                        // everytime if you click the reset button it will switch to Undo button
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
    
    func reSet(){
        list.previousTickList = list.returnTickList()
        list.removeTickList()
        reSetUndo = true
        Milestone_1App.save()
    }
    
    func unDo(){
        list.updateUndo(previousOne: list.previousTickList)
        reSetUndo = false
        Milestone_1App.save()
    }
    
    
    func move(from source: IndexSet, to destination:Int) {
        let index = source.endIndex.description
        let position = index.index(index.startIndex, offsetBy: 6)
        var from : Int
        from = Int(index[position].description) ?? 10
        list.moveIndex(from: from-1, to: destination-1)
        Milestone_1App.save()

        
    }
    
    func delete(at offsets: IndexSet) {
//        list.checklist.lists.remove(atOffsets: offsets)
        let index = offsets.endIndex.description
        let position = index.index(index.startIndex, offsetBy: 6)
        var num : Int
        num = Int(index[position].description) ?? 10
        list.deleteList(position: num-1)
        Milestone_1App.save()
        
        
        
        
        
       
        
        


    }
    
    
}



//
//struct CheckListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
//    }
//}
