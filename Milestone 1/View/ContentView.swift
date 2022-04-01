//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI


struct ContentView: View {
    var checklist: [CheckListViewModle]

    
    var body: some View {
        NavigationView {
            ChecklistView(checklist: checklist)
        }
    }

 
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(checklist: [
            CheckListViewModle(checklist: CheckList(title: "Hello1")),
            CheckListViewModle(checklist: CheckList(title: "Hello2")),
            CheckListViewModle(checklist: CheckList(title: "Hello3"))
        ])
    }
}



