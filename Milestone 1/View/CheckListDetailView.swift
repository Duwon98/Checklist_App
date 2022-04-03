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
        VStack{
//            Text(list.checklist.title)
//            List (Array를 어떻게 수정할건지 고민)
            TextField((list.checklist.title), text: $list.checklist.title)
        }
    }
}

struct CheckListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CheckListDetailView(list: CheckListViewModle(checklist: CheckList(title: "some list")))
    }
}
