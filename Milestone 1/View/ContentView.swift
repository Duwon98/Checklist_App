//
//  ContentView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI



struct ContentView: View {
    @State private var users = ["Paul", "Taylor", "Adele"]

    var body: some View {
        NavigationView {
            List {
                ForEach(users, id: \.self) { list in
                    Text(list)
                }
                .onDelete(perform: delete)
            }
            .toolbar {
                EditButton()
            }
        }
    }

    func delete(at offsets: IndexSet) {
        users.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

