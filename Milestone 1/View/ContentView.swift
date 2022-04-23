//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI
import UIKit


struct ContentView: View {
    @Binding var checklist: [CheckListViewModel]
    
    var body: some View {
        NavigationView {
            ChecklistView(checklist: $checklist)
                }
            }
        }


