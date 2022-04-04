//
//  CheckListDetailView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

struct CheckListDetailView: View {
    @ObservedObject var list: CheckList
    @State var isEditMode: EditMode = .inactive
    var body: some View {
        VStack{
            if (self.isEditMode == .active)  {
                HStack{
                    Text("✓    ")
                    TextField((list.title), text:$list.title).navigationTitle(" ")
                }
            }
            
            Form{
                ForEach(list.lists, id: \.self){thing in
//                    Text(thing)
                        if (self.isEditMode == .active)  {
//                            Need to figure it out how to change the lists
  
                        }
                }
                    

                    
            }.toolbar{
                EditButton()
                .environment(\.editMode, self.$isEditMode)

        }

            }.navigationTitle(list.title)
        }

        
            
        
//    func delete(at offsets: IndexSet) {
//        list.lists.remove(atOffsets: offsets)
//    }
}



//
//struct CheckListDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
//    }
//}
