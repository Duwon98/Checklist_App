//
//  CheckListDetailView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

struct CheckListDetailView: View {
    @ObservedObject var list: CheckList
    @State var addString : String = ""
    @State var isEditMode: EditMode = .inactive
    @State var copyCheckedList = [Bool]()
    @State var reSetUndo = false
    var body: some View {
        VStack{
            // If you are on the edit mode -> you can edit the navigation title
            if (self.isEditMode == .active)  {
                HStack{
                    Text("📝")
                    TextField((list.title), text:$list.title).navigationTitle(" ")
                }
            }
            // Listing the lists
            List{
                ForEach(list.index, id: \.self){i in
                    HStack{
                        // if you are on the edit mode -> display the delete button
                        if (self.isEditMode == .active)  {
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
                        Text(list.lists[i])
                        if(list.tickList[i]){
                            Spacer()
                            Text("✓")
                        }
                    }
                }
                    // if you are on the edit mode -> display the add list row
                    if (self.isEditMode == .active){
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
                        if (self.isEditMode == .active){
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
                    .environment(\.editMode, self.$isEditMode)
                    }
        }
            }.navigationTitle(list.title)
            
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
    
}



//
//struct CheckListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
//    }
//}
