//
//  CheckListDetailView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

struct CheckListDetailView: View {
    @ObservedObject var list: CheckListViewModle
    var body: some View {
//        VStack{
//            TextField((list.checklist.title), text: $list.checklist.title)
//        }
        List{
            ForEach(list.lists, id: \.self){thing in
                Text(thing)
            }.onDelete(perform: delete)
            
        }.toolbar{
            EditButton()
        }
}
    func delete(at offsets: IndexSet) {
        list.lists.remove(atOffsets: offsets)
    }
}



struct CheckListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
    }
}
