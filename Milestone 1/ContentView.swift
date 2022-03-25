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
                List(games){ game in
                    HStack{
                        Text(game.name)
                        if (game.playing == true){
                            Text("✓").frame(width: 100, height: 1, alignment: .trailing)
                        }
                    }
                }.navigationTitle("Games")
                }
        }
    }


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

