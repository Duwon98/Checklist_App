//
//  MasterView.swift
//  Milestone 1
//
//  Created by Duwon Ha on 1/4/2022.
//

import SwiftUI

//Master view
struct ChecklistView: View {
    @State var checklist: [CheckListViewModle]
//    @State var checklist: [CheckListViewModle] = {
//        guard let data = try? Data(contentsOf: ChecklistView.fileURL),
//              let checklist = try? JSONDecoder().decode([CheckListViewModle].self, from: data)else{
//            return checklist: [CheckListViewModle]
//        }
//        return checklist
//    }
    var body: some View {

            List{
                ForEach(checklist){list in
                    CheckListRowView(checklist: list)
                }
                .onDelete(perform: delete)
            }
            .navigationTitle("CheckLists")
            .toolbar{

                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                     EditButton()
                    
                 }
                 
                 ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                     Button("Add", action: add)
                     
                 }
            }
    }
    
    func delete(at offsets: IndexSet) {
        checklist.remove(atOffsets: offsets)
        save()
    }
    
    func add(){
        checklist.append(CheckListViewModle(checklist: CheckList(title: "Checklist")))
        save()
    }
    
    var fileURL : URL {
        let fileName = "checklist.json"
        let fm = FileManager.default
        guard let documentDir = fm.urls(for: .documentDirectory, in: .userDomainMask).first else{return URL(fileURLWithPath: "/") }
        let fileURL = documentDir.appendingPathComponent(fileName)
        return fileURL
    }
    
    func save(){
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
struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        ChecklistView(checklist: [])
    }
}


