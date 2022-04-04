//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI


struct ContentView: View {
    @State var checklist: [CheckList]

    
    var body: some View {
        NavigationView {
            ChecklistView(checklist: checklist)

        }
        
        
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(checklist: [
            CheckList(title: "Hello1")
        ])
    }
}




