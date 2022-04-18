//
//  CheckListDetailView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

struct CheckListDetailView: View {
    @Binding var list: CheckListViewModle
    @State var addString : String = ""
    @Environment(\.editMode) var mode
    @State var copyCheckedList = [Bool]()
    @State var reSetUndo = false
    
    var body: some View {
        VStack{
            // If you are on the edit mode -> you can edit the navigation title
            if self.mode?.wrappedValue.isEditing ?? true  {
                HStack{
                    Text("📝")
                    TextField((list.checklist.title), text:$list.checklist.title).navigationTitle(" ")
                }
            }
            // Listing the lists
            List{
                ForEach(list.index, id: \.self){i in
                    HStack{
                        // if you are on the edit mode -> display the delete button
                        if self.mode?.wrappedValue.isEditing ?? true  {
                            Button("⊖", action: {
                                list.deleteList(position: i)
                            }  )
//                            TextField((list.lists[i]), text:$list.lists[i])
                            
                            // if you are not on the edit mode -> you can tick
                        }else{
                            Button(" ", action: {
                                list.tick(position: i)
                            })
                        }
                        Text(list.checklist.lists[i])
                        if(list.tickList[i]){
                            Spacer()
                            Text("✓")
                        }
                    }
                }
                .onMove(perform: move)
                
                    // if you are on the edit mode -> display the add list row
                if self.mode?.wrappedValue.isEditing ?? true{
                        HStack{
                        Button("+", action: {
                            if (addString != "" ){
                                list.addList(name: addString)
                                addString = ""
                            }
                        })
                        TextField(("Please put something"), text:$addString)
                        }
                    }
            }.toolbar{
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
    }
    
    func unDo(){
        list.updateUndo(previousOne: list.previousTickList)
        reSetUndo = false
    }
    
    func move(from source: IndexSet, to destination:Int) {
        list.checklist.lists.move(fromOffsets: source, toOffset: destination)
        
    }
    
    
}



//
//struct CheckListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
//    }
//}
