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
            
            List{
                ForEach(list.index, id: \.self){i in
                        if (self.isEditMode == .active)  {
                            TextField((list.lists[i]), text:$list.lists[i])
                            
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
