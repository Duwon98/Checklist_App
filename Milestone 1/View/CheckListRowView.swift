//
//  CheckListRowView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 3/4/2022.
//

import SwiftUI

struct CheckListRowView: View {
    @ObservedObject var checklist: CheckList
    
    var body: some View {
        NavigationLink("\(checklist.title)"){
            CheckListDetailView(list: checklist)
//                .navigationTitle(checklist.title)
                
                
        }
    }
}

//
//struct CheckListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CheckListRowView()
//    }
//}
