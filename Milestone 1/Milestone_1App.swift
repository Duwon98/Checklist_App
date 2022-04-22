//  Milestone_1App.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI

@main
struct Milestone_1App: App {
    static var checklistExport = [CheckListViewModle]()
    static var checklist : [CheckListViewModle] = {
        guard let data = try? Data(contentsOf: Milestone_1App.fileURL),
              let checklist = try? JSONDecoder().decode([CheckListViewModle].self, from: data) else{

            ContentView.isDataLoading = false
            return [CheckListViewModle]()
        }
        checklistExport = checklist
        ContentView.isDataLoading = false
    
        return checklist
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(checklist: Binding(get: {Milestone_1App.checklist}, set: {
                newValue in
                Milestone_1App.checklist = newValue
            }))
        }
    }
    

    static var fileURL : URL {
        let fileName = "checklist.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else{return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    static func save(){
        do {
            let data = try JSONEncoder().encode(checklist)
            try data.write(to: fileURL , options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8)else{return}
            print(dataString)
        } catch{
            print("Could not write file : \(error)")
        }
    }
}

