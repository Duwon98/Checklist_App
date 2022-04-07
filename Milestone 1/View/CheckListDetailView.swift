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
            if (self.isEditMode == .active)  {
                HStack{
                    Text("📝")
                    TextField((list.title), text:$list.title).navigationTitle(" ")
//                    if (!reSetUndo){
//                        Button("Reset", action: {
//                            reSet()
//                        })
//                    }else{
//                        Button("Undo", action: {
//                            unDo()
//                        })
//                    }
                    
                    
                }
            }
            
            List{
                ForEach(list.index, id: \.self){i in
                    HStack{
                        if (self.isEditMode == .active)  {
                            Button("⊖", action: {
                                list.deleteList(position: i)
                            }  )
                        
//                            TextField((list.lists[i]), text:$list.lists[i])
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
//                    ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
//                         EditButton()
//                        .environment(\.editMode, self.$isEditMode)
//                     }
//                if (self.isEditMode == .active){
                    ToolbarItem(placement: .navigationBarTrailing){
                        if (self.isEditMode == .active){
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
//                }
                
                    
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                    .environment(\.editMode, self.$isEditMode)
                    }
                

        }
            }.navigationTitle(list.title)
            
        }

    
    func add(_txt: String){
        list.addList(name: _txt)
    }
    
    func removeList(_n: Int){
        list.deleteList(position: _n)
    }
    

    
    
    func reSet(){
//        copyCheckedList = list.returnTickList()
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
