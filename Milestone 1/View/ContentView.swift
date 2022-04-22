//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI
import UIKit


struct ContentView: View {
    @Binding var checklist: [CheckListViewModle]
    static var isDataLoading = true
    
    var body: some View {
        LoadingView(isShowing: ContentView.isDataLoading) {
        NavigationView {
            ChecklistView(checklist: $checklist)
            
            
        }
            }
                }
    
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(checklist: [CheckListViewModle]())
//    }
//}
//
//
//

