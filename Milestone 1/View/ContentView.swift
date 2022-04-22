//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI
import UIKit


struct ContentView: View {
//    @State private var _isLoading: Bool = false
    @Binding var checklist: [CheckListViewModle]
//    @State private var isDataLoading = true
    
    var body: some View {
        
        NavigationView {
            ChecklistView(checklist: $checklist)
            
        }
        
//        if _isLoading{
//            ZStack{
//                Color(.systemBackground)
//                    .ignoresSafeArea()
//            }
//
//            ProgressView()
//                .progressViewStyle(CircularProgressViewStyle(tint: .black))
//        }
        

            }
//func loadingCall(){
//    _isLoading = true
//    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//        _isLoading = false
//    }
//        }
                    }



//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(checklist: [CheckListViewModle]())
//    }
//}
//
//
//

