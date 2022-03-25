//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI



struct ContentView: View {

    var body: some View {
        NavigationView{
            List(games){
                Text($0.name)
            }.navigationTitle("Games")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

