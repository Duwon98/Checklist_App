//  Milestone_1App.swift
//  Milestone 1
//
//  Created by Duwon Ha on 18/3/2022.
//

import SwiftUI

@main
struct Milestone_1App: App {
    /// in order to present Loading page
    @State private var _isLoading: Bool = true
    /// checklistExport property will be used in ChecklistView as @State to display the changed values lively
    static var checklistExport = [CheckListViewModel]()
    /// It will check if there is Json file in fileURL
    static var checklist : [CheckListViewModel] = {
        guard let data = try? Data(contentsOf: Milestone_1App.fileURL),
              let checklist = try? JSONDecoder().decode([CheckListViewModel].self, from: data) else{
            /// if there is no Json file, it will just return the empty [CheckListViewModel]
            return [CheckListViewModel]()
        }
        checklistExport = checklist
        return checklist
    }()

    var body: some Scene {
        WindowGroup {
            /// if isLoading is True -> Display ProgressView with new view
            if _isLoading{
                ZStack(alignment: .center){
                    Color(.systemBackground)
                        .ignoresSafeArea()
                    
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .black))
                }.onAppear { loadingCall() }
            }
            /// if isLoading is False -> Display ContentView
            else{
                ContentView(checklist: Binding(get: {Milestone_1App.checklist}, set: {
                    newValue in
                    Milestone_1App.checklist = newValue
                }))
            }
        }
    }
    
    /// <#Description#>
    /// The isLoading will be changed to false after 1.5 second
    func loadingCall(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            _isLoading = false
        }
            }

    /// <#Description#>
    /// Following variable will ceate the file name of the Json then will return the fileURL 
    static var fileURL : URL {
        let fileName = "checklist.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else{return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }

    /// <#Description#>
    /// The following function is for saving values in Json file
    static func save(){
        do {
            /// It will encode the checklist then write them in fileURL in Json
            let data = try JSONEncoder().encode(checklist)
            try data.write(to: fileURL , options: .atomic)
            guard let dataString = String(data: data, encoding: .utf8)else{return}
            print(dataString)
        } catch{
            print("Could not write file : \(error)")
        }
    }
}

