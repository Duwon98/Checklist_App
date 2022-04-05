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
    @State var tick : Bool = false
    @State var isEditMode: EditMode = .inactive
    var body: some View {
        VStack{
            if (self.isEditMode == .active)  {
                HStack{
                    Text("✓    ")
                    TextField((list.title), text:$list.title).navigationTitle(" ")
                }
            }
            
            List{
                ForEach(list.index, id: \.self){i in
                    HStack{
                        if (self.isEditMode == .active)  {
                            Button("D", action: {
                                list.deleteList(position: i)
                            }  ).background(Color.blue)
                                .foregroundColor(Color.white)
                            
                            // **Button issue
                            // **tickle and untickle
                            // **reset button
                            
//                            TextField((list.lists[i]), text:$list.lists[i])
                        }
                        
                        Text(list.lists[i])
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
                EditButton()
                .environment(\.editMode, self.$isEditMode)

        }

            

            }.navigationTitle(list.title)
        }

    
    func add(_txt: String){
        list.addList(name: _txt)
    }
    
    func removeList(_n: Int){
        list.deleteList(position: _n)
    }
    
    func tickAndOff (){
        if (tick){
            tick = false
        }else{
            tick = true
        }
    }
    

}



//
//struct CheckListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
//    }
//}
